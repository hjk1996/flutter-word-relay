import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:text_project/di/di.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/game_screen/bl/player.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';
import 'package:text_project/presentation/game_screen/components/game_setting_dialog.dart';
import 'package:text_project/presentation/game_screen/game_screen_event.dart';
import 'package:text_project/presentation/game_screen/game_screen_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreenViewModel with ChangeNotifier {
  final Referee _referee;
  GameScreenViewModel({required Referee referee}) : _referee = referee;

  GameScreenState _state = GameScreenState(
    messages: [],
    setting:
        const GameSetting(difficulty: GameDifficulty.easy, isPlayerFirst: true),
    isLoading: false,
    isPlaying: false,
  );
  GameScreenState get state => _state;
  Referee get referee => _referee;
  StreamSubscription<RefereeResponse>? _refereeSubscription;
  final _eventController = StreamController<GameScreenEvent>.broadcast();
  Stream<GameScreenEvent> get eventStream => _eventController.stream;

  // 유저가 viewModel에 message를 보냄
  // viewModel은 다시 referee에게 message를 전달함.
  Future<void> sendMessage(String word) async {
    try {
      final message = Message(
        id: FirebaseAuth.instance.currentUser!.uid,
        messageType: MessageType.playing,
        content: word,
        createdAt: DateTime.now(),
      );

      _updateMessage(message: message);
      _startLoading();
      await _referee.receiveMessage(message);
    } on RefereeException catch (err) {
      _eventController.add(GameScreenEvent.onError(err.cause));
    } catch (err) {
      _eventController.add(const GameScreenEvent.onError('알 수 없는 에러가 발생했습니다.'));
    } finally {
      _endLoading();
    }
  }

  void _startLoading() {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
  }

  void _endLoading() {
    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }

  void _updateMessage({required Message message}) {
    _state = _state.copyWith(
      messages: [message, ..._state.messages],
    );
    notifyListeners();
  }

  Future<void> init() async {
    try {
      await _referee.init();
      _refereeSubscription ??=
          _referee.refereeResponseStream.listen(_handleRefereeResponse);
    } on FirebaseException catch (err) {
      _eventController
          .add(const GameScreenEvent.onError('서버에서 데이터를 불러오는데 실패했습니다.'));
    } catch (err) {
      _eventController.add(
          const GameScreenEvent.onError('서버에서 데이터를 불러오는 중 알 수 없는 에러가 발생했습니다.'));
    }
  }

  // referee가 상대의 단어를 확인하고 올바른 경우 다음 차례의 플레이어에게 행동을 요구할 때 발동
  void _whenAskNextMove() {
    // 처음 시작할 때 null check 오류 발생하는거 방지하기 위해서 조건 달아놓음.
    if (referee.lastValidMessage == null) return;
    if (referee.lastValidMessage!.id !=
        FirebaseAuth.instance.currentUser!.uid) {
      _state = _state
          .copyWith(messages: [referee.lastValidMessage!, ..._state.messages]);
      notifyListeners();
    }
  }

  // referee가 단어가 올바르지 않다는 이벤트를 발생시켰을 경우 발동
  void _whenNotValidWord(RefereeResponse response) {
    _state = _state.copyWith(messages: [response.message!, ..._state.messages]);
    notifyListeners();
  }

  // referee가 game이 끝났다는 이벤트를 발생시켰을 경우 발동
  void _whenGameEnd(RefereeResponse response) async {
    _state = _state.copyWith(isLoading: false, isPlaying: false);
    notifyListeners();
    _eventController.add(GameScreenEvent.onGameEnd(response));
  }

  // referee의 noti를 처리해주는 함수
  void _handleRefereeResponse(RefereeResponse response) {
    switch (response.responseTypes) {
      case RefereeResponseTypes.askNextMove:
        _whenAskNextMove();
        break;
      case RefereeResponseTypes.notValidWord:
        _whenNotValidWord(response);
        break;
      case RefereeResponseTypes.gameEnd:
        _whenGameEnd(response);
        break;
      case RefereeResponseTypes.error:
        _eventController
            .add(GameScreenEvent.onError(response.message!.content));
        break;
      default:
        break;
    }
  }

  // 게임 시작할 때 선수를 등록함.
  void startGame(GameSetting setting) {
    _state = GameScreenState(
      messages: [],
      setting: setting,
      isLoading: false,
      isPlaying: true,
    );
    final player =
        Player(referee: referee, id: FirebaseAuth.instance.currentUser!.uid);
    final otherPlayer = makeBot(setting.difficulty, referee);
    notifyListeners();

    if (setting.isPlayerFirst) {
      _referee.startGame(
          setting: setting, player1: player, player2: otherPlayer);
    } else {
      _referee.startGame(
          setting: setting, player1: otherPlayer, player2: player);
    }
  }

  void endGame() {
    _referee.endGame();
    _state = _state.copyWith(
      messages: List.from(_referee.messages.reversed),
      setting: _state.setting,
      isLoading: false,
      isPlaying: false,
    );
    notifyListeners();
  }

  void resetChat() {
    _state = GameScreenState(
      messages: [],
      setting: _state.setting,
      isLoading: false,
      isPlaying: false,
    );
    notifyListeners();
  }

  Future<void> saveWord(String word) async {
    try {
      final repo = GetIt.instance<FirestoreRepo>();
      final wordInfo = await repo.getWordInfo(word);
      final prefs = await SharedPreferences.getInstance();
      var dataString = prefs.getString('notes');
      List<dynamic> data = dataString == null ? [] : jsonDecode(dataString);
      data = [
        ...data,
        {
          'word': word,
          "isFavorite": false,
          "meanings": wordInfo.meanings,
          "savedAt": DateTime.now().toIso8601String(),
        }
      ];
      await prefs.setString('notes', jsonEncode(data));
      _eventController.add(GameScreenEvent.onSaveWord(word));
    } on FirebaseException catch (_) {
      _eventController.add(
        const GameScreenEvent.onError('서버에서 단어에 대한 정보를 받아오지 못했습니다.'),
      );
    } catch (err) {
      _eventController.add(
        const GameScreenEvent.onError('단어를 노트에 저장하는 중 알 수 없는 에러가 발생했습니다.'),
      );
    }
  }

  @override
  void dispose() {
    _refereeSubscription?.cancel();
    _eventController.close();
    super.dispose();
  }
}

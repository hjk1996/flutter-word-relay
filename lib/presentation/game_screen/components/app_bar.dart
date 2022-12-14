import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/components/game_setting_dialog.dart';
import 'package:text_project/presentation/game_screen/components/countdown_timer.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:get_it/get_it.dart';

class GameScreenAppBar extends StatefulWidget with PreferredSizeWidget {
  const GameScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<GameScreenAppBar> createState() => _GameScreenAppBarState();
}

class _GameScreenAppBarState extends State<GameScreenAppBar>
    with TickerProviderStateMixin {
  // final AnimationController controller = AnimationController(
  //   vsync: this.,
  //   duration: const Duration(seconds: 200),
  // );

  final Stopwatch stopwatch = Stopwatch();

  late StreamSubscription<RefereeResponse> _refereeResponseSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<GameScreenViewModel>();
      _refereeResponseSubscription =
          viewModel.referee.refereeResponseStream.listen((response) {
        if (response.responseTypes == RefereeResponseTypes.askNextMove) {
          stopwatch.reset();
          stopwatch.start();
        }
      });
    });
  }

  @override
  void dispose() {
    _refereeResponseSubscription.cancel();
    super.dispose();
  }

  void _unfocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameScreenViewModel>(
      builder: (context, viewModel, child) {
        return AppBar(
          leading: IconButton(
            onPressed: () async {
              _unfocus();
              final answer =
                  await askYesOrNo(context: context, content: '???????????? ???????????????????');
              if (answer == true && mounted) {
                viewModel.endGame();
                viewModel.resetChat();
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.exit_to_app),
          ),
          title: Column(
            children: [
              Text(
                viewModel.referee.usedWords.isNotEmpty &&
                        viewModel.state.isPlaying
                    ? viewModel.referee.usedWords.last
                    : '',
              ),
              const CountDownTimer(),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () async {
                _unfocus();
                if (viewModel.state.isPlaying) {
                  final answer = await askYesOrNo(
                      context: context, content: '????????? ?????????????????????????');
                  if (answer == null || answer == false || !mounted) return;
                  if (answer == true) {
                    // ????????? ????????? ?????? ??????.
                    viewModel.referee.receiveMessage(
                      Message(
                        id: FirebaseAuth.instance.currentUser!.uid,
                        messageType: MessageType.giveUp,
                        content: '',
                        createdAt: DateTime.now(),
                      ),
                    );
                    viewModel.endGame();
                  }
                } else {
                  final setting = await showDialog<GameSetting>(
                    context: context,
                    builder: (context) => const GameSettingDialog(),
                  );
                  if (setting == null) return;
                  // check whether internet is connected before starting game
                  final connectionStatus = await GetIt.instance
                      .get<Connectivity>()
                      .checkConnectivity();

                  if (connectionStatus == ConnectivityResult.none) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('????????? ????????? ???????????? ????????????.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('??????'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  viewModel.startGame(setting);
                }
              },
              icon: Icon(
                  viewModel.state.isPlaying ? Icons.stop : Icons.play_arrow),
            )
          ],
        );
      },
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_project/domain/model/message.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';

part 'game_log.freezed.dart';
part 'game_log.g.dart';

@freezed
class GameLog with _$GameLog {
  @JsonSerializable(explicitToJson: true)
  factory GameLog({
    required String id,
    required GameDifficulty difficulty,
    required DateTime endAt,
    required bool win,
    required List<Message> log,
  }) = _GameLog;
  factory GameLog.fromJson(Map<String, dynamic> json) =>
      _$GameLogFromJson(json);
}

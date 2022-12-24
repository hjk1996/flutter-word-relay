import 'package:provider/provider.dart';
import 'package:text_project/data/data_source/firestore_helper.dart';
import 'package:text_project/data/data_source/storage_helper.dart';
import 'package:text_project/data/repository/storage_repo_impl.dart';
import 'package:text_project/data/repository/firestore_repo_impl.dart';
import 'package:text_project/domain/repository/storage_repo.dart';
import 'package:text_project/domain/repository/firestore_repo.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/game_screen/bl/referee.dart';
import 'package:text_project/presentation/game_screen/bl/robot_player.dart';
import 'package:text_project/presentation/game_screen/bl/player_abc.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:text_project/presentation/game_screen/game_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

void initialSetUp() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<FirestoreRepo>(FirestoreRepoImpl(FirestoreHelper()));
  getIt.registerSingleton<FirebaseStorageRepo>(
      FirebaseStorageRepoImpl(helper: FirebaseStorageHelper()));
  getIt.registerSingleton(Referee(wordsRepo: getIt<FirestoreRepo>()));
  getIt.registerSingleton(Connectivity());
}

RobotPlayerABC makeBot(GameDifficulty difficulty, Referee referee) {
  final getIt = GetIt.instance;
  return RobotPlayer(
      difficulty: difficulty,
      referee: getIt<Referee>(),
      wordsRepo: getIt<FirestoreRepo>());
}

// List<ChangeNotifierProvider> getProviders() {
//   return [
//     ChangeNotifierProvider(create: (context) => AuthScreenViewModel()),
//     ChangeNotifierProvider(create: (context) => HomeScreenViewModel()),
//     ChangeNotifierProvider(create: (context) => NoteScreenViewModel()),
//     ChangeNotifierProvider(
//       create: (context) => GameScreenViewModel(
//         referee: GetIt.instance<Referee>(),
//       ),
//     ),
//     ChangeNotifierProvider(
//         create: (context) => UserScreenViewModel(
//               repo: GetIt.instance<FirebaseStorageRepo>(),
//             )),
//   ];
// }

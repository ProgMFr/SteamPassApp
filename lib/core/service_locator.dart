import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:steampass/blocs/add_game/addgame_cubit.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/blocs/saved_games/saved_games_cubit.dart';
import 'package:steampass/blocs/search/search_cubit.dart';
import 'package:steampass/domain/data/repositories/saved_game_repo.dart';
import 'package:steampass/domain/data/repositories/userconfig_repo.dart';
import 'package:steampass/domain/api/search_game.dart';
import '../domain/data/local/database.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  // Register HiveService
  getIt.registerSingleton<HiveService>(HiveService());

  // Initialize Hive
  await getIt<HiveService>().init();

  getIt.registerFactory<UserConfigRepo>(() => UserConfigRepoImpl(getIt()));
  getIt.registerSingleton<GameRepository>(
    GameRepositoryImpl(getIt<HiveService>()),
  );
  getIt.registerFactory<SearchGameRepository>(
    () => SearchGameRepositoryImpl(getIt<Dio>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt<SearchGameRepository>()),
  );
  getIt.registerFactory<AddGameCubit>(() => AddGameCubit());
  getIt.registerFactory<SavedGamesCubit>(
    () => SavedGamesCubit(getIt<GameRepository>()),
  );

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(getIt<UserConfigRepo>()),
  );
}

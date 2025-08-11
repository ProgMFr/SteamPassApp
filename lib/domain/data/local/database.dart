// lib/services/hive_service.dart
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:steampass/domain/data/local/adapters/user_config_model.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'adapters/game_model.dart';

class HiveService {
  // Hive initialization
  Future<void> init() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init('${appDocumentDir.path}/SteamPass/Database');

      Hive.registerAdapter(GameAdapter());
      Hive.registerAdapter(UserConfigAdapter());

      await Hive.openBox<Game>('games');
      await Hive.openBox<UserConfig>('userConfig');

      print('Hive initialized successfully');
    } catch (e) {
      print('Error initializing Hive: $e');
      throw Exception('Failed to initialize Hive');
    }
  }

  Box<Game> get gamesBox => Hive.box<Game>('games');
  Box<UserConfig> get userConfigBox => Hive.box<UserConfig>('userConfig');

  Future<void> close() async => await Hive.close();
}

// lib/data/repositories/game_repository.dart
import 'dart:io';

import '../local/database.dart';
import '../local/adapters/game_model.dart';

abstract class GameRepository {
  Future<void> addGame(Game game);
  List<Game> getAllGames();
  Game? getGame(String id);
  Future<String> deleteGame(String id);
  Future<void> deleteFiles(List files);
}

class GameRepositoryImpl implements GameRepository {
  final HiveService _hiveService;

  GameRepositoryImpl(this._hiveService);

  //! Get Game

  @override
  Game? getGame(String id) {
    try {
      return _hiveService.gamesBox.values.firstWhere((game) => game.id == id);
    } catch (e) {
      return null;
    }
  }

  //! Add Game

  @override
  Future<void> addGame(Game game) async {
    final existingGame = getGame(game.id);
    if (existingGame != null) {
      return;
    }
    await _hiveService.gamesBox.add(game);
  }

  //! Get All Games

  @override
  List<Game> getAllGames() {
    try {
      final List<Game> savedGames =
          _hiveService.gamesBox.values.toList().reversed.toList();
      return savedGames;
    } catch (e) {
      throw "error";
    }
  }

  //! Delete Game

  @override
  Future<String> deleteGame(String id) async {
    final game = getGame(id);
    if (game != null) {
      await deleteFiles(game.files);
      await _hiveService.gamesBox.delete(game.key);
      return "success";
    }
    return "NotFound";
  }

  //! Delete Game Files

  @override
  Future<void> deleteFiles(List files) async {
    for (var file in files) {
      if (File(file).existsSync()) {
        await File(file).delete();
      }
    }
  }
}

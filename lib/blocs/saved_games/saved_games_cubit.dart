import 'package:bloc/bloc.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/domain/data/local/adapters/game_model.dart';
import 'package:steampass/domain/data/repositories/saved_game_repo.dart';
import 'package:steampass/presentation/widgets/delete_game_dialog.dart';

part 'saved_games_state.dart';

class SavedGamesCubit extends Cubit<SavedGamesState> {
  final GameRepository getGameRepo;
  SavedGamesCubit(this.getGameRepo)
    : super(SavedGamesState(status: SavedGamesStatus.initial)) {
    loadSavedGames();
  }

  void loadSavedGames() {
    emit(SavedGamesState(status: SavedGamesStatus.loading));

    try {
      final List<Game> savedGames = getGameRepo.getAllGames();

      if (savedGames.isNotEmpty) {
        emit(
          state.copyWith(
            status: SavedGamesStatus.loaded,
            savedGames: savedGames,
          ),
        );
      } else {
        emit(state.copyWith(status: SavedGamesStatus.empty, savedGames: []));
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: SavedGamesStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void deleteGame({
    required String id,
    required BuildContext context,
    required String gameName,
    required List filesPaths,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return deleteGameDialog(
          context: context,
          gameName: gameName,
          filesPaths: filesPaths,
          onDeleteConfirmed: () => _onDeleteConfirm(id, context),
        );
      },
    );
  }

  _onDeleteConfirm(String id, BuildContext context) async {
    print("Deleting game with ID: $id");
    try {
      final result = await getGameRepo.deleteGame(id);
      if (result == "success") {
        print("Game deleted successfully");
        loadSavedGames();
      } else {
        throw ("NotFound");
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: Text("Error"),
            content: Text("Failed to delete game: ${e.toString()}"),
            actions: [
              Button(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

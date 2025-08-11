part of 'saved_games_cubit.dart';

enum SavedGamesStatus { initial, loading, loaded, empty, error }

extension SavedGamesStatusX on SavedGamesStatus {
  bool get isInitial => this == SavedGamesStatus.initial;
  bool get isLoading => this == SavedGamesStatus.loading;
  bool get isLoaded => this == SavedGamesStatus.loaded;
  bool get isEmpty => this == SavedGamesStatus.empty;
  bool get isError => this == SavedGamesStatus.error;
}

class SavedGamesState {
  final SavedGamesStatus status;
  final List<Game>? savedGames;
  final String? errorMessage;

  const SavedGamesState({
    this.status = SavedGamesStatus.initial,
    this.savedGames,
    this.errorMessage,
  });

  SavedGamesState copyWith({
    SavedGamesStatus? status,
    List<Game>? savedGames,
    String? errorMessage,
  }) {
    return SavedGamesState(
      status: status ?? this.status,
      savedGames: savedGames ?? this.savedGames,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavedGamesState &&
        other.status == status &&
        other.savedGames == savedGames &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode =>
      status.hashCode ^ savedGames.hashCode ^ errorMessage.hashCode;

  @override
  String toString() =>
      'SavedGamesState(status: $status, savedGames: $savedGames, errorMessage: $errorMessage)';
}

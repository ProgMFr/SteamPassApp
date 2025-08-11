part of 'addgame_cubit.dart';

enum AddGameDialogStatus { closed, open }

extension AddGameDialogStatusX on AddGameDialogStatus {
  bool get isClosed => this == AddGameDialogStatus.closed;
  bool get isOpen => this == AddGameDialogStatus.open;
}

enum AddGameStatus {
  initial,
  searchGame,
  dllNotFound,
  dllDownloading,
  dllDownloaded,
  downloadMenifest,
  notFound,
  restartSteam,
  gameAdded,
  error,
}

extension AddGameStatusX on AddGameStatus {
  bool get isInitial => this == AddGameStatus.initial;
  bool get isSearchGame => this == AddGameStatus.searchGame;
  bool get isdownloadMenifest => this == AddGameStatus.downloadMenifest;
  bool get isnotFound => this == AddGameStatus.notFound;
  bool get isError => this == AddGameStatus.error;
  bool get isRestartSteam => this == AddGameStatus.restartSteam;
  bool get isGameAdded => this == AddGameStatus.gameAdded;
  bool get isDllNotFound => this == AddGameStatus.dllNotFound;
  bool get isDllDownloading => this == AddGameStatus.dllDownloading;
  bool get isDllDownloaded => this == AddGameStatus.dllDownloaded;
}

class AddGameState {
  final AddGameDialogStatus dialogStatus;
  final AddGameStatus status;
  final String? errorMessage;
  final double? indicator;
  final String? gameName;
  final String? filePath;
  final double? progress;
  final int? totalfiles;
  final int? completedFiles;
  final String? githubReset;

  const AddGameState({
    this.dialogStatus = AddGameDialogStatus.closed,
    this.status = AddGameStatus.initial,
    this.errorMessage,
    this.indicator = 10,
    this.gameName,
    this.filePath,
    this.progress = 0,
    this.totalfiles = 0,
    this.completedFiles = 0,
    this.githubReset,
  });

  AddGameState copyWith({
    AddGameDialogStatus? dialogStatus,
    AddGameStatus? status,
    String? errorMessage,
    double? indicator,
    String? gameName,
    String? filePath,
    double? progress,
    int? totalfiles,
    int? completedFiles,
    String? githubReset,
  }) {
    return AddGameState(
      dialogStatus: dialogStatus ?? this.dialogStatus,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      indicator: indicator ?? this.indicator,
      gameName: gameName ?? this.gameName,
      filePath: filePath ?? this.filePath,
      progress: progress ?? this.progress,
      totalfiles: totalfiles ?? this.totalfiles,
      completedFiles: completedFiles ?? this.completedFiles,
      githubReset: githubReset ?? this.githubReset,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddGameState &&
        other.dialogStatus == dialogStatus &&
        other.status == status &&
        other.errorMessage == errorMessage &&
        other.indicator == indicator &&
        other.gameName == gameName &&
        other.filePath == filePath &&
        other.progress == progress &&
        other.totalfiles == totalfiles &&
        other.completedFiles == completedFiles &&
        other.githubReset == githubReset;
  }

  @override
  int get hashCode =>
      dialogStatus.hashCode ^
      status.hashCode ^
      errorMessage.hashCode ^
      indicator.hashCode ^
      gameName.hashCode ^
      filePath.hashCode ^
      progress.hashCode ^
      totalfiles.hashCode ^
      completedFiles.hashCode ^
      githubReset.hashCode;

  @override
  String toString() =>
      'AddGameState(dialogStatus:$dialogStatus,status: $status, errorMessage: $errorMessage, indicator: $indicator , gameName:$gameName,filePath: $filePath , progress: $progress ,totalfiles: $totalfiles, completedFiles: $completedFiles  , githubReset: $githubReset)';
}

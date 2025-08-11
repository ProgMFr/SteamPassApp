// import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/domain/data/models/steam_search_model.dart';
import 'package:steampass/domain/api/get_manifest.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:steampass/presentation/add_game_page.dart';
import 'package:steampass/utils/helpers/github_rate_helper.dart';
import 'package:steampass/utils/helpers/registry_search_helper.dart';
import 'package:steampass/utils/helpers/steam_helper.dart';

part 'addgame_state.dart';

class AddGameCubit extends Cubit<AddGameState> {
  AddGameCubit()
    : super(const AddGameState(dialogStatus: AddGameDialogStatus.closed));

  String? isSteamExist(BuildContext context) {
    final steamPath = getSteamPathFromRegistry();
    if (steamPath == null) {
      emit(
        state.copyWith(
          status: AddGameStatus.error,
          errorMessage: "SteamIsNotInstalled",
        ),
      );
      showDialog(
        context: context,
        builder: (context) {
          return ContentDialog(
            title: Text(
              AppLocalizations.of(context)!.error,

              style: FluentTheme.of(context).typography.title,
            ),
            content: Text(
              AppLocalizations.of(context)!.steamNotInstalled,
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
          );
        },
      );
      return null;
    }
    return steamPath;
  }

  Future<String> get checkDllExist => checkDllFile();

  void searchGame(BuildContext context, GameItem gameDetails) async {
    final homeCubit = context.read<HomeCubit>();
    final steamPath = isSteamExist(context);
    if (steamPath == null) {
      return;
    }
    emit(
      state.copyWith(
        status: AddGameStatus.searchGame,
        gameName: gameDetails.name,
        indicator: 10,
        dialogStatus: AddGameDialogStatus.open,
      ),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AddGameDialog(context: context, gameDetails: gameDetails);
      },
    );

    if (await checkDllExist == "notfound") {
      emit(
        state.copyWith(
          status: AddGameStatus.dllNotFound,
          errorMessage: "HidDllNotFound",
        ),
      );
      return;
    } else if (await checkDllExist == "disabled") {
      try {
        await toggleSteamPass(true);
        homeCubit.enableSteamPass();
        downloadManifest(context, gameDetails);
      } catch (e) {
        emit(
          state.copyWith(
            status: AddGameStatus.error,
            errorMessage: e.toString(),
          ),
        );
        return;
      }
      return;
    } else {
      downloadManifest(context, gameDetails);
      return;
    }
  }

  void closeDialog() {
    emit(AddGameState(dialogStatus: AddGameDialogStatus.closed));
  }

  void _updateProgress(double value, int totalFiles, int completedFiles) {
    emit(
      state.copyWith(
        progress: value,
        totalfiles: totalFiles,
        completedFiles: completedFiles,
      ),
    );
  }

  void downloadDll(BuildContext context, String gameId, String gameName) async {
    emit(state.copyWith(status: AddGameStatus.dllDownloading));
    try {
      final dll = await downloadDllFile();
      if (dll == "success") {
        context.read<HomeCubit>().enableSteamPass();
        emit(
          state.copyWith(
            status: AddGameStatus.dllDownloaded,
            errorMessage: null,
          ),
        );
      }
    } catch (e) {
      print("Error downloading DLL: $e");
      if (e.toString() == 'dLLFileNotFound') {
        emit(
          state.copyWith(
            status: AddGameStatus.notFound,
            errorMessage: e.toString(),
          ),
        );
        return;
      } else if (e.toString() == 'GithubReachLimit') {
        final rateLimit = await checkRateLimit();
        emit(
          state.copyWith(
            status: AddGameStatus.error,
            errorMessage: e.toString(),
            githubReset: rateLimit['resetTime'],
          ),
        );
        return;
      } else {
        emit(
          state.copyWith(
            status: AddGameStatus.error,
            errorMessage: e.toString(),
          ),
        );
      }
      return;
    }
  }

  void _updateProgressFile(String filePath) {
    emit(state.copyWith(filePath: filePath));
  }

  void _updateIndicator(double value) {
    emit(state.copyWith(indicator: value));
  }

  void downloadManifest(BuildContext context, GameItem gameDetails) async {
    final steamPath = isSteamExist(context);
    if (steamPath == null) {
      return;
    }
    try {
      var gameInfo = await searchGameGithub(gameDetails.id.toString());

      emit(
        state.copyWith(status: AddGameStatus.downloadMenifest, indicator: 30),
      );
      try {
        final resultDownload = await getManifestFiles(
          gameInfo,
          _updateProgress,
          _updateIndicator,
          _updateProgressFile,
          steamPath,
          gameDetails,
        );
        if (resultDownload == "success") {
          Future.delayed(const Duration(seconds: 1), () {
            emit(
              state.copyWith(status: AddGameStatus.gameAdded, indicator: 70),
            );
          }).then((_) {
            restartSteamC();
          });
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: AddGameStatus.error,
            errorMessage: e.toString(),
          ),
        );
        return;
      }
    } catch (e) {
      if (e.toString() == 'GameNotFoundGithub') {
        emit(state.copyWith(status: AddGameStatus.notFound));
        return;
      } else if (e.toString() == 'GithubReachLimit') {
        final rateLimit = await checkRateLimit();
        emit(
          state.copyWith(
            status: AddGameStatus.error,
            errorMessage: e.toString(),
            githubReset: rateLimit['resetTime'],
          ),
        );
        return;
      } else {
        emit(
          state.copyWith(
            status: AddGameStatus.error,
            errorMessage: e.toString(),
          ),
        );
        return;
      }
    }
  }

  void notFound() {
    emit(state.copyWith(status: AddGameStatus.notFound));
  }

  void restartSteamC() {
    emit(state.copyWith(status: AddGameStatus.restartSteam, indicator: 100));
  }
}

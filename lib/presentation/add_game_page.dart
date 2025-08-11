import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steampass/blocs/add_game/addgame_cubit.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/domain/data/models/steam_search_model.dart';
import 'package:steampass/utils/helpers/steam_helper.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';

class AddGameDialog extends StatelessWidget {
  final GameItem gameDetails;
  const AddGameDialog({
    super.key,
    required BuildContext context,
    required this.gameDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddGameCubit, AddGameState>(
      builder: (context, state) {
        // var dialogStatus = state.dialogStatus;
        var status = state.status;

        return ContentDialog(
          title: _addGameDialogTitle(status, context, state),

          style: ContentDialogThemeData(),
          content: _addGameDialogBody(status, context, state),
          actions: _addGameDialogAction(status, context, state),
        );
      },
    );
  }

  List<Widget> _addGameDialogAction(
    AddGameStatus status,
    BuildContext context,
    AddGameState state,
  ) {
    return switch (status) {
      AddGameStatus.notFound => [_closeButton(context)],
      AddGameStatus.error => [
        // state.errorMessage == "GithubReachLimit"
        //     ? FilledButton(
        //       onPressed: () {
        //         context.read<AddGameCubit>().closeDialog();
        //         Navigator.of(context).pop();
        //         context.read<HomeCubit>().changePage(2);
        //       },
        //       style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
        //       child: Text(AppLocalizations.of(context)!.goToSettings),
        //     )
        //     : SizedBox(),
        _closeButton(context),
      ],

      AddGameStatus.gameAdded => [_closeButton(context)],
      AddGameStatus.restartSteam => [
        _closeButton(context),
        FilledButton(
          onPressed: () {
            restartSteam();
            context.read<AddGameCubit>().closeDialog();
            Navigator.of(context).pop();
          },
          style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
          child: Text(AppLocalizations.of(context)!.restartSteam),
        ),
      ],
      AddGameStatus.dllNotFound => [
        FilledButton(
          onPressed: () {
            context.read<AddGameCubit>().closeDialog();
            Navigator.of(context).pop();
          },
          style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
          child: Text(AppLocalizations.of(context)!.close),
        ),
        FilledButton(
          onPressed: () {
            context.read<AddGameCubit>().downloadDll(
              context,
              gameDetails.id.toString(),
              gameDetails.name.toString(),
            );
          },
          style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
          child: Text(AppLocalizations.of(context)!.download),
        ),
      ],
      AddGameStatus.dllDownloaded => [
        FilledButton(
          onPressed: () {
            context.read<AddGameCubit>().downloadManifest(context, gameDetails);
          },
          style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
          child: Text(AppLocalizations.of(context)!.continueDl),
        ),
      ],
      // // TODO: Handle this case.
      // AddGameStatus.error => null,
      AddGameStatus.dllDownloading => [
        Row(
          spacing: 10,
          children: [
            Text(AppLocalizations.of(context)!.pleaseWait),
            Spacer(),
            ProgressBar(
              value: state.indicator,
              activeColor: material.Colors.deepOrange,
              strokeWidth: 6,
              backgroundColor: material.Colors.grey,
            ),
            Text(
              "${state.indicator!.toInt()}%",
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
          ],
        ),
      ],
      AddGameStatus.initial => [],

      _ => [
        Row(
          spacing: 10,
          children: [
            Text(AppLocalizations.of(context)!.pleaseWait),
            Spacer(),
            ProgressBar(
              value: state.indicator,
              activeColor: material.Colors.deepOrange,
              strokeWidth: 6,
              backgroundColor: material.Colors.grey,
            ),
            Text(
              "${state.indicator!.toInt()}%",
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
          ],
        ),
      ],
    };
  }

  FilledButton _closeButton(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.read<AddGameCubit>().closeDialog();
        Navigator.of(context).pop();
      },
      style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
      child: Text(AppLocalizations.of(context)!.close),
    );
  }

  Column _addGameDialogTitle(
    AddGameStatus status,
    BuildContext context,
    AddGameState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          status.isRestartSteam
              ? AppLocalizations.of(context)!.gameAddedSuccess
              : status.isGameAdded
              ? AppLocalizations.of(context)!.gameAddedSuccess
              : status.isError
              ? AppLocalizations.of(context)!.error
              : status.isnotFound
              ? AppLocalizations.of(context)!.gameNotFoundTitle
              : status.isdownloadMenifest
              ? AppLocalizations.of(context)!.manifestFound
              : status.isDllDownloading
              ? AppLocalizations.of(context)!.dLLFileNotFound
              : status.isDllDownloaded
              ? AppLocalizations.of(context)!.dllFileSuccessDl
              : status.isDllNotFound
              ? AppLocalizations.of(context)!.dLLFileNotFound
              : AppLocalizations.of(context)!.searchingManifest,
          style: FluentTheme.of(context).typography.title,
        ),
        Text(
          state.gameName ?? "",
          style: FluentTheme.of(
            context,
          ).typography.caption!.copyWith(fontSize: 14),
        ),
      ],
    );
  }

  Column _addGameDialogBody(
    AddGameStatus status,
    BuildContext context,
    AddGameState state,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: switch (status) {
        AddGameStatus.initial => [],
        AddGameStatus.searchGame => [
          Text(
            AppLocalizations.of(context)!.searchingManifest,
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
        ],
        AddGameStatus.downloadMenifest => [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.downloadingFile,
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              Text(
                "${state.filePath}",
                textDirection: TextDirection.ltr,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FluentTheme.of(context).typography.caption,
              ),
            ],
          ),
          Row(
            children: [
              ProgressBar(
                // value: state.progress,
                activeColor: material.Colors.deepOrange,
                strokeWidth: 6,
                backgroundColor: material.Colors.grey,
              ),
              SizedBox(width: 10),
              Text(
                "${state.progress!.toInt()}%",
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              SizedBox(width: 10),
              Text(
                "${state.completedFiles} / ",
                style: FluentTheme.of(context).typography.body,
              ),
              Text(
                "${state.totalfiles} ",
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              Text(
                AppLocalizations.of(context)!.files,
                style: FluentTheme.of(context).typography.body,
              ),
            ],
          ),
        ],
        AddGameStatus.notFound => [
          Text(
            AppLocalizations.of(context)!.gameNotFoundError,
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
        ],
        AddGameStatus.gameAdded => [
          Text(
            AppLocalizations.of(context)!.gameAddedSuccess,
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
        ],
        AddGameStatus.restartSteam => [
          Text(
            AppLocalizations.of(context)!.restartSteamCaption,
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
        ],
        AddGameStatus.error => [
          switch (state.errorMessage) {
            "GithubReachLimit" => Text(
              "${AppLocalizations.of(context)!.githubReachLimitError} ${state.githubReset ?? ""}",
              style: FluentTheme.of(context).typography.bodyStrong,
            ),

            "ManifestNotFound" => Text(
              AppLocalizations.of(context)!.manifestNotFountError,
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
            "dLLFileNotFound" => Text(
              AppLocalizations.of(context)!.dllFileNotFoundError,
              style: FluentTheme.of(context).typography.bodyStrong,
            ),
            "ConnectionError" => Text(
              AppLocalizations.of(context)!.connectionError,
              style: FluentTheme.of(context).typography.bodyStrong,
            ),

            _ => Text(""),
          },
        ],
        AddGameStatus.dllNotFound => [
          Text(
            AppLocalizations.of(context)!.steamPassRequired,
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
          SizedBox(height: 10),
          Expander(
            contentPadding: const EdgeInsets.all(0),
            headerBackgroundColor: WidgetStatePropertyAll(
              FluentTheme.of(context).scaffoldBackgroundColor,
            ),
            header: Text(
              AppLocalizations.of(context)!.dllFileInfoHeader,

              style: FluentTheme.of(context).typography.bodyStrong,
            ),
            content: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dllFileInfo,

                        style: FluentTheme.of(
                          context,
                        ).typography.caption!.copyWith(
                          fontSize: 15,
                          color:
                              getIt<HomeCubit>().state.isDark
                                  ? material.Colors.white70
                                  : material.Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.dllFileInfoNote,

                        style: FluentTheme.of(
                          context,
                        ).typography.caption!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onStateChanged: (open) {},
          ),
        ],
        AddGameStatus.dllDownloading => [
          Text(
            AppLocalizations.of(context)!.dllFileDownloading,
            style: FluentTheme.of(context).typography.bodyStrong,
          ),
          SizedBox(height: 10),
          ProgressBar(
            // value: state.progress,
            activeColor: material.Colors.deepOrange,
            strokeWidth: 6,
            backgroundColor: material.Colors.grey,
          ),
        ],
        AddGameStatus.dllDownloaded => [],
      },
    );
  }
}

import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';

ContentDialog deleteGameDialog({
  required BuildContext context,
  required String gameName,
  required List filesPaths,
  required VoidCallback onDeleteConfirmed,
}) {
  final String pathlist = List.generate(
    filesPaths.length,
    (index) => '[${index + 1}]  ${filesPaths[index]}\n\n',
  ).join('');

  return ContentDialog(
    title: Text(
      AppLocalizations.of(context)!.deleteManifest,
      style: FluentTheme.of(context).typography.title,
    ),
    // style: ContentDialogThemeData(padding: const EdgeInsets.all(20)),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(gameName, style: FluentTheme.of(context).typography.bodyStrong),
        SizedBox(height: 10),
        Expander(
          contentPadding: const EdgeInsets.all(0),
          headerBackgroundColor: WidgetStatePropertyAll(
            FluentTheme.of(context).scaffoldBackgroundColor,
          ),
          header: Text(
            AppLocalizations.of(context)!.filesWillRemoved,

            style: FluentTheme.of(context).typography.bodyStrong,
          ),
          content: SizedBox(
            height: 200,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  pathlist,
                  textAlign: TextAlign.left,
                  textDirection: TextDirection.ltr,
                  style: FluentTheme.of(
                    context,
                  ).typography.bodyStrong!.copyWith(color: Colors.red),
                ),
              ),
            ),
          ),
          // onStateChanged: (open) {},
        ),
      ],
    ),
    actions: [
      FilledButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
        child: Text(AppLocalizations.of(context)!.cancel),
      ),
      FilledButton(
        onPressed: () {
          onDeleteConfirmed();
          Navigator.of(context).pop();
        },
        style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
        child: Text(AppLocalizations.of(context)!.deleteManifest),
      ),
    ],
  );
}

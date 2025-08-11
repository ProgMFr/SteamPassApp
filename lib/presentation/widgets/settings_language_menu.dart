import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';

class LanguageOption {
  final Locale locale;
  final String name;

  LanguageOption(this.locale, this.name);

  @override
  bool operator ==(Object other) =>
      other is LanguageOption &&
      other.locale.languageCode == locale.languageCode;

  @override
  int get hashCode => locale.languageCode.hashCode;
}

class SettingsLanguageMenu extends StatefulWidget {
  final String selectedLanguage;
  const SettingsLanguageMenu({super.key, required this.selectedLanguage});

  @override
  State<SettingsLanguageMenu> createState() => _SettingsLanguageMenuState();
}

class _SettingsLanguageMenuState extends State<SettingsLanguageMenu> {
  late List<LanguageOption> _languageOptions;

  void onLanguageChanged(String? lang, BuildContext context) {
    getIt<HomeCubit>().changeLanguage(lang!);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _buildLanguageList();
  }

  void _buildLanguageList() {
    _languageOptions =
        AppLocalizations.supportedLocales.map((locale) {
          final localizations = lookupAppLocalizations(locale);
          return LanguageOption(locale, localizations.languageName);
        }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ComboBox(
      value: widget.selectedLanguage,
      style: FluentTheme.of(context).typography.body,

      isExpanded: true,
      items:
          _languageOptions.map((option) {
            return ComboBoxItem(
              value: option.locale.languageCode,
              child: Text(
                option.name,
                style: FluentTheme.of(context).typography.body,
              ),
            );
          }).toList(),
      onChanged: (value) => onLanguageChanged(value, context),
    );
  }
}

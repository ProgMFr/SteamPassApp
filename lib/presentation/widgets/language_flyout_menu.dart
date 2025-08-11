import 'package:country_flags/country_flags.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';

class LanguageOption {
  final Locale locale;
  final String countryCode;

  LanguageOption(this.locale, this.countryCode);

  @override
  bool operator ==(Object other) =>
      other is LanguageOption &&
      other.locale.languageCode == locale.languageCode;

  @override
  int get hashCode => locale.languageCode.hashCode;
}

class LanguagePicker extends StatefulWidget {
  const LanguagePicker({super.key});

  @override
  State<LanguagePicker> createState() => _LanguagePickerState();
}

class _LanguagePickerState extends State<LanguagePicker> {
  late List<LanguageOption> _languageOptions;

  late LanguageOption _selectedLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildLanguageList();
  }

  void _buildLanguageList() {
    _languageOptions =
        AppLocalizations.supportedLocales.map((locale) {
          final localizations = lookupAppLocalizations(locale);
          return LanguageOption(locale, localizations.countryCode);
        }).toList();
    final currentLocale = Localizations.localeOf(context);
    _selectedLanguage = _languageOptions.firstWhere(
      (option) => option.locale.languageCode == currentLocale.languageCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      title: SizedBox(
        width: 20,
        height: 20,
        child: FittedBox(
          alignment: Alignment.center,
          child: CountryFlag.fromCountryCode(_selectedLanguage.countryCode),
        ),
      ),
      menuShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),

      items:
          _languageOptions.map((option) {
            return MenuFlyoutItem(
              text: SizedBox(
                width: 20,
                height: 20,
                child: FittedBox(
                  alignment: Alignment.center,
                  child: CountryFlag.fromCountryCode(option.countryCode),
                ),
              ),
              onPressed: () {
                context.read<HomeCubit>().changeLanguage(
                  option.locale.languageCode,
                );
              },
              selected: _selectedLanguage == option,
            );
          }).toList(),
    );
  }
}

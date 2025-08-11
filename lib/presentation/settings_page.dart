import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as ficon;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:steampass/presentation/widgets/settings_language_menu.dart';
import 'package:steampass/utils/constants/colors.dart';
import 'package:steampass/utils/constants/config.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),

          children: [
            Text(
              AppLocalizations.of(context)!.settings,
              style: FluentTheme.of(context).typography.title,
            ),
            SizedBox(height: 20),
            // --- Appearance Section ---
            _settingsSectionCard(
              title: AppLocalizations.of(context)!.appearance,
              context: context,
              children: [ThemeContainer(), LanguageContainer(state: state)],
            ),
            SizedBox(height: 20),
            // --- General Section ---
            _settingsSectionCard(
              title: AppLocalizations.of(context)!.generalSettings,
              context: context,
              children: [
                Stack(
                  children: [
                    SteamPassContainer(state: state),
                    state.steamPassExist
                        ? SizedBox()
                        : Positioned.fill(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),

                            decoration: BoxDecoration(
                              color: FluentTheme.of(
                                context,
                              ).cardColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!.mustAddGameFirst,
                                style: FluentTheme.of(context).typography.body,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // --- Steam Options Section ---
            _settingsSectionCard(
              title: AppLocalizations.of(context)!.steamTools,
              context: context,
              children: [
                Row(
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.steamStatus} : ",
                      style: FluentTheme.of(context).typography.body,
                    ),
                    Text(
                      state.isSteamOpen
                          ? AppLocalizations.of(context)!.steamIsOpen
                          : AppLocalizations.of(context)!.steamIsClosed,
                      style: FluentTheme.of(
                        context,
                      ).typography.bodyStrong!.copyWith(
                        color: state.isSteamOpen ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SteamToolContainer(),
              ],
            ),
            SizedBox(height: 20),
            // --- About Section ---
            _settingsAppInfoCard(context: context),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }

  _settingsAppInfoCard({required BuildContext context}) {
    return Acrylic(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: FluentTheme.of(context).cardColor, width: 1),
      ),
      tint: FluentTheme.of(context).cardColor,
      luminosityAlpha: 1,
      blurAmount: 50,
      elevation: 0,
      shadowColor: null,
      tintAlpha: 100,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/app_logo.png", height: 100),
              const SizedBox(height: 10),
              Text(
                "SteamPass",
                style: FluentTheme.of(context).typography.title,
              ),

              Text("1.0.0", style: FluentTheme.of(context).typography.body),
              const SizedBox(height: 5),
              Text(
                "© 2025 Muhamed Farqad.",
                style: FluentTheme.of(context).typography.body,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(ConfigConstants.githubUrl));
                    },
                    icon: Icon(
                      FontAwesomeIcons.github,
                      size: 20,
                      color:
                          FluentTheme.of(context).brightness.isDark
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(ConfigConstants.telegramUrl));
                    },
                    icon: Icon(
                      FontAwesomeIcons.telegram,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(ConfigConstants.instagramUrl));
                    },
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      size: 20,
                      color: AppColors.redAccent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(ConfigConstants.steamPassWebSite));
                    },
                    icon: Icon(
                      FontAwesomeIcons.globe,
                      size: 20,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _settingsSectionCard({
    required title,
    required children,
    required BuildContext context,
  }) {
    return Acrylic(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: FluentTheme.of(context).cardColor, width: 1),
      ),

      tint: FluentTheme.of(context).cardColor,

      luminosityAlpha: 1,

      blurAmount: 50,
      elevation: 0,
      shadowColor: null,
      tintAlpha: 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: FluentTheme.of(context).typography.subtitle),
            const SizedBox(height: 12.0),
            ...children,
          ],
        ),
      ),
    );
  }
}

class InfoSettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const InfoSettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title),
      trailing: trailing,
      onPressed: onPressed ?? () {},
    );
  }
}

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({super.key});
  void onThemeChanged(BuildContext context) {
    getIt<HomeCubit>().toggleDark();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = FluentTheme.of(context).brightness.isDark;
    return InfoSettingItem(
      icon:
          isDarkMode
              ? ficon.FluentIcons.weather_moon_32_filled
              : ficon.FluentIcons.weather_sunny_32_filled,
      title: AppLocalizations.of(context)!.theme,
      trailing: ToggleSwitch(
        checked: isDarkMode,
        onChanged: (_) => onThemeChanged(context),
        content: Text(
          isDarkMode
              ? AppLocalizations.of(context)!.dark
              : AppLocalizations.of(context)!.light,
        ),
      ),
    );
  }
}

class SteamPassContainer extends StatelessWidget {
  final HomeState state;
  const SteamPassContainer({super.key, required this.state});
  void changeSteamPassStatus(BuildContext context, bool isEnabled) {
    getIt<HomeCubit>().updateSteamPassStatus(isEnabled, context);
  }

  @override
  Widget build(BuildContext context) {
    return InfoSettingItem(
      icon:
          state.isSteamPassEnabled
              ? ficon.FluentIcons.checkbox_indeterminate_16_regular
              : ficon.FluentIcons.checkbox_unchecked_16_regular,
      title: AppLocalizations.of(context)!.enableSteamPass,
      trailing: ToggleSwitch(
        checked: state.isSteamPassEnabled,
        onChanged:
            (_) => changeSteamPassStatus(context, !state.isSteamPassEnabled),
        content: Text(
          state.isSteamPassEnabled
              ? AppLocalizations.of(context)!.enabled
              : AppLocalizations.of(context)!.disabled,
        ),
      ),
    );
  }
}

class SteamToolContainer extends StatelessWidget {
  const SteamToolContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(
          onPressed: () {
            getIt<HomeCubit>().restSteam();
          },
          child: Text(AppLocalizations.of(context)!.restartSteam),
        ),
        Text("-"),
        Button(
          onPressed: () {
            getIt<HomeCubit>().exitSteam();
          },
          child: Text(AppLocalizations.of(context)!.closeSteam),
        ),
      ],
    );
  }
}

class LanguageContainer extends StatelessWidget {
  final HomeState state;
  const LanguageContainer({super.key, required this.state});

  void onLanguageChanged(String? lang, BuildContext context) {
    context.read<HomeCubit>().changeLanguage(lang!);
  }

  @override
  Widget build(BuildContext context) {
    return InfoSettingItem(
      icon: FluentIcons.locale_language,
      title: AppLocalizations.of(context)!.language,
      trailing: SizedBox(
        width: 150,
        child: SettingsLanguageMenu(selectedLanguage: state.language),
      ),
    );
  }
}

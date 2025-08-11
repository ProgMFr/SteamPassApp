import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter/material.dart' as material;
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart' as ficon;
import 'package:steampass/blocs/home/home_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:steampass/blocs/search/search_cubit.dart';
import 'package:steampass/presentation/saved_games_page.dart';
import 'package:steampass/presentation/search_page.dart';
import 'package:steampass/presentation/settings_page.dart';
import 'package:steampass/presentation/widgets/language_flyout_menu.dart';
import 'package:steampass/utils/constants/colors.dart';
import 'package:steampass/utils/constants/config.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future _updateDialog(BuildContext context, HomeState state) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ContentDialog(
          title: Text(AppLocalizations.of(context)!.updateAvailable),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${AppLocalizations.of(context)!.version} :  ${state.updateInfo!.version}",
                style: FluentTheme.of(context).typography.body,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(
                  context,
                )!.updateDate(state.updateInfo!.releaseDate),
                style: FluentTheme.of(context).typography.body,
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.of(
                  context,
                )!.updateSize(state.updateInfo!.releaseSize),
                style: FluentTheme.of(context).typography.body,
              ),
              SizedBox(height: 10),
              Expander(
                contentPadding: const EdgeInsets.all(0),
                headerBackgroundColor: WidgetStatePropertyAll(
                  FluentTheme.of(context).scaffoldBackgroundColor,
                ),
                header: Text(
                  AppLocalizations.of(context)!.updateNotes,

                  style: FluentTheme.of(context).typography.bodyStrong,
                ),
                content: SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        state.updateInfo!.releaseNotes,
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        style: FluentTheme.of(context).typography.body,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            FilledButton(
              onPressed: () async {
                await launchUrl(Uri.parse(state.updateInfo!.downloadUrl));
              },
              style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
              child: Text(AppLocalizations.of(context)!.downloadUpdate),
            ),
            state.updateInfo!.isMandatory == false
                ? FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: FluentTheme.of(context).buttonTheme.filledButtonStyle,
                  child: Text(AppLocalizations.of(context)!.updateLater),
                )
                : SizedBox(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.isUpdateAvailable) {
            _updateDialog(context, state);
          }
        },
        builder: (context, state) {
          int tapIndex = state.tapIndex;
          return NavigationView(
            transitionBuilder: (child, animation) {
              return DrillInPageTransition(animation: animation, child: child);
            },
            // appBar: const NavigationAppBar(title: Text('NavigationView')),
            contentShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),

            pane: NavigationPane(
              size: const NavigationPaneSize(
                openMaxWidth: 280,
                openMinWidth: 280,
                compactWidth: 280,
              ),
              toggleable: false,

              selected: state.tapIndex,
              onChanged: (index) => getIt<HomeCubit>().changePage(index),
              displayMode: PaneDisplayMode.open,

              indicator: StickyNavigationIndicator(
                color:
                    tapIndex == 0
                        ? material.Colors.deepOrange
                        : tapIndex == 1
                        ? material.Colors.deepPurpleAccent
                        : material.Colors.blueGrey,
              ),
              header: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 260,
                  height: 80,
                  // color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _appName(context),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LanguagePicker(),
                              SizedBox(width: 7),
                              _toggleTheme(state, context),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration.zero,

                            animatedTexts: [
                              ColorizeAnimatedText(
                                colors:
                                    state.isDark
                                        ? [
                                          material.Colors.grey.shade400,
                                          material.Colors.grey.shade800,
                                        ]
                                        : [
                                          material.Colors.blueGrey.shade400,
                                          material.Colors.black26,
                                        ],
                                "Muhamed Farqad",
                                speed: const Duration(milliseconds: 400),

                                textStyle:
                                    FluentTheme.of(context).typography.caption!,
                              ),
                            ],
                          ),

                          SizedBox(width: 20),
                          _socialButtons(context, state),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              items: [
                PaneItem(
                  selectedTileColor: WidgetStatePropertyAll(
                    tapIndex == 0
                        ? material.Colors.deepOrange.withAlpha(30)
                        : null,
                  ),

                  icon: Icon(
                    tapIndex == 0
                        ? ficon.FluentIcons.screen_search_20_filled
                        : ficon.FluentIcons.screen_search_20_regular,
                    size: 22,
                    color: tapIndex == 0 ? material.Colors.deepOrange : null,
                  ),

                  title: Text(AppLocalizations.of(context)!.search),
                  body: SearchPage(),
                ),
                PaneItem(
                  selectedTileColor: WidgetStatePropertyAll(
                    tapIndex == 1
                        ? material.Colors.deepPurpleAccent.withAlpha(30)
                        : null,
                  ),
                  icon: Icon(
                    tapIndex == 1
                        ? ficon.FluentIcons.xbox_controller_32_filled
                        : ficon.FluentIcons.xbox_controller_20_regular,
                    size: 22,
                    color:
                        tapIndex == 1 ? material.Colors.deepPurpleAccent : null,
                  ),
                  title: Text(AppLocalizations.of(context)!.savedgames),

                  body: SavedGamesPage(),
                ),

                PaneItem(
                  selectedTileColor: WidgetStatePropertyAll(
                    tapIndex == 2
                        ? material.Colors.blueGrey.withAlpha(30)
                        : null,
                  ),
                  icon: Icon(
                    tapIndex == 2
                        ? ficon.FluentIcons.settings_20_filled
                        : ficon.FluentIcons.settings_20_regular,
                    size: 22,
                    color: tapIndex == 2 ? material.Colors.blueGrey : null,
                  ),
                  title: Text(AppLocalizations.of(context)!.settings),

                  body: SettingsPage(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AnimatedTextKit _appName(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      isRepeatingAnimation: true,
      displayFullTextOnTap: false,
      pause: Duration.zero,

      animatedTexts: [
        TypewriterAnimatedText(
          AppLocalizations.of(context)!.appName,
          speed: const Duration(milliseconds: 200),
          curve: Curves.linearToEaseOut,

          textStyle: FluentTheme.of(context).typography.titleLarge,
        ),
        ColorizeAnimatedText(
          colors: [
            material.Colors.red,
            material.Colors.deepOrange,
            material.Colors.purple,
            material.Colors.deepPurple,
          ],
          "${AppLocalizations.of(context)!.appName}_",
          speed: const Duration(milliseconds: 400),

          textStyle: FluentTheme.of(context).typography.titleLarge!,
        ),
      ],
    );
  }

  Tooltip _toggleTheme(HomeState state, BuildContext context) {
    return Tooltip(
      // message: 'Horizontal ToolTip',
      displayHorizontally: false,
      useMousePosition: false,
      richMessage: TextSpan(
        text:
            state.isDark
                ? AppLocalizations.of(context)!.lightMode
                : AppLocalizations.of(context)!.darkMode,
        style: FluentTheme.of(context).typography.body,
      ),

      style: const TooltipThemeData(
        preferBelow: true,
        waitDuration: Duration.zero,
      ),
      child: IconButton(
        onPressed: () {
          getIt<HomeCubit>().toggleDark();
        },
        icon: Icon(
          state.isDark
              ? ficon.FluentIcons.weather_sunny_32_filled
              : ficon.FluentIcons.weather_moon_32_filled,
          size: 18,
        ),
      ),
    );
  }

  Row _socialButtons(BuildContext context, HomeState state) {
    return Row(
      spacing: 2,
      children: [
        _tooltip(
          context,
          child: IconButton(
            onPressed: () async {
              await launchUrl(Uri.parse(ConfigConstants.steamPassWebSite));
            },
            icon: FaIcon(FontAwesomeIcons.globe, color: AppColors.orange),
          ),
          message: AppLocalizations.of(context)!.visitSteamPassWebsite,
        ),
        _tooltip(
          context,
          child: IconButton(
            onPressed: () async {
              await launchUrl(Uri.parse(ConfigConstants.instagramUrl));
            },
            icon: FaIcon(
              FontAwesomeIcons.instagram,
              color: AppColors.redAccent,
            ),
          ),
          message: AppLocalizations.of(context)!.instagramContact,
        ),
        _tooltip(
          context,
          child: IconButton(
            onPressed: () async {
              await launchUrl(Uri.parse(ConfigConstants.telegramUrl));
            },
            icon: FaIcon(
              FontAwesomeIcons.telegram,
              color: AppColors.blueAccent,
            ),
          ),
          message: AppLocalizations.of(context)!.telegramContact,
        ),
        _tooltip(
          context,
          child: IconButton(
            onPressed: () async {
              await launchUrl(Uri.parse(ConfigConstants.githubUrl));
            },
            icon: FaIcon(
              FontAwesomeIcons.github,
              color: state.isDark ? Colors.white : Colors.black,
            ),
          ),
          message: AppLocalizations.of(context)!.githubRepo,
        ),
      ],
    );
  }

  Tooltip _tooltip(
    BuildContext context, {
    required String message,
    required Widget child,
  }) {
    return Tooltip(
      displayHorizontally: false,
      useMousePosition: false,
      richMessage: TextSpan(
        text: message,
        style: FluentTheme.of(context).typography.body,
      ),

      style: const TooltipThemeData(
        preferBelow: true,
        waitDuration: Duration.zero,
      ),
      child: child,
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:steampass/blocs/saved_games/saved_games_cubit.dart';
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/domain/data/local/adapters/game_model.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:steampass/utils/constants/colors.dart';

class SavedGamesPage extends StatelessWidget {
  const SavedGamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SavedGamesCubit>(),
      child: Container(
        color: FluentTheme.of(context).scaffoldBackgroundColor,
        child: BlocConsumer<SavedGamesCubit, SavedGamesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status.isLoading) {
              return Center(child: ProgressRing());
            }
            if (state.status.isEmpty) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.noGameUnlockedYet,
                  style: FluentTheme.of(context).typography.body,
                ),
              );
            }
            if (state.status.isLoaded) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  int columns = (constraints.maxWidth / 250).floor();

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columns,

                      mainAxisExtent: 280,
                    ),

                    itemCount: state.savedGames!.length,

                    itemBuilder: (context, index) {
                      var game = state.savedGames![index];

                      return GameContainer(game: game);
                    },
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class GameContainer extends StatefulWidget {
  final Game game;
  const GameContainer({super.key, required this.game});

  @override
  State<GameContainer> createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {
  bool isHovered = false;
  bool havePrice = true;
  String priceConvert(price) {
    if (price == null) return 'Free';

    return '${int.parse(price) / 100} \$';
  }

  @override
  void initState() {
    if (widget.game.price == null || widget.game.price == "0") {
      setState(() {
        havePrice = false;
      });
    } else {
      setState(() {
        havePrice = true;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            isHovered = false;
          });
        },
        child: Tilt(
          borderRadius: BorderRadius.circular(15),
          lightConfig: LightConfig(minIntensity: 0.0, maxIntensity: 0.4),
          lightShadowMode: LightShadowMode.base,

          shadowConfig: ShadowConfig(disable: true),

          child: Acrylic(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),

            tint: FluentTheme.of(context).cardColor,

            luminosityAlpha: 1,

            blurAmount: 50,
            elevation: 0,
            shadowColor: null,
            tintAlpha: 100,

            child: Container(
              height: 280,

              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow:
                          isHovered
                              ? [
                                BoxShadow(
                                  color: FluentTheme.of(context).shadowColor,
                                  blurRadius: 50,
                                  spreadRadius: 5,
                                ),
                              ]
                              : [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,

                        transformAlignment: Alignment.center,

                        transform:
                            isHovered
                                ? (Matrix4.identity()..scale(1.3))
                                : Matrix4.identity(),
                        child: CachedNetworkImage(
                          imageUrl: widget.game.image!,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.fill,

                          errorWidget: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 120,
                              color:
                                  FluentTheme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.cardColorDark
                                      : Colors.red,
                              child: Image.asset(
                                "assets/app_logo.png",
                                fit: BoxFit.contain,
                              ),
                            );
                          },

                          placeholder: (context, p1) {
                            return Container(
                              width: double.infinity,
                              height: 120,
                              color:
                                  FluentTheme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.cardColorDark
                                      : AppColors.lightGrey,
                              child: Center(
                                child: ProgressRing(
                                  activeColor: Colors.orange.dark,
                                  strokeWidth: 2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.game.name.toString(),
                                  overflow: TextOverflow.fade,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Text(
                                priceConvert(widget.game.price),

                                style: FluentTheme.of(
                                  context,
                                ).typography.caption!.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Tooltip(
                                  displayHorizontally: false,
                                  useMousePosition: false,
                                  richMessage: TextSpan(
                                    text:
                                        AppLocalizations.of(
                                          context,
                                        )!.copyGameId,
                                    style:
                                        FluentTheme.of(context).typography.body,
                                  ),

                                  style: const TooltipThemeData(
                                    preferBelow: true,
                                    waitDuration: Duration.zero,
                                  ),
                                  child: Button(
                                    onPressed: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                          text: widget.game.id.toString(),
                                        ),
                                      );
                                      displayInfoBar(
                                        context,
                                        builder: (context, close) {
                                          return InfoBar(
                                            title: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "${AppLocalizations.of(context)!.gameIdCopied} : ",
                                                  style:
                                                      FluentTheme.of(
                                                        context,
                                                      ).typography.bodyStrong,
                                                ),

                                                Text(
                                                  "${widget.game.id} ",
                                                  style:
                                                      FluentTheme.of(
                                                        context,
                                                      ).typography.body,
                                                ),
                                              ],
                                            ),

                                            style: InfoBarThemeData(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                            ),
                                            severity: InfoBarSeverity.success,
                                          );
                                        },
                                      );
                                    },
                                    style: ButtonStyle(
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          WidgetStateProperty.resolveWith(
                                            (states) =>
                                                states.isPressed
                                                    ? FluentTheme.of(
                                                      context,
                                                    ).shadowColor.withAlpha(50)
                                                    : states.isHovered
                                                    ? FluentTheme.of(
                                                      context,
                                                    ).shadowColor.withAlpha(30)
                                                    : Colors.transparent,
                                          ),
                                    ),
                                    child: Text(
                                      widget.game.id.toString(),
                                      style:
                                          FluentTheme.of(
                                            context,
                                          ).typography.body,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),

                                havePrice
                                    ? FilledButton(
                                      style:
                                          FluentTheme.of(
                                            context,
                                          ).buttonTheme.filledButtonStyle,
                                      onPressed: () {
                                        context
                                            .read<SavedGamesCubit>()
                                            .deleteGame(
                                              id: widget.game.id,
                                              context: context,
                                              gameName: widget.game.name,
                                              filesPaths: widget.game.files,
                                            );
                                      },

                                      child: Text(
                                        AppLocalizations.of(
                                          context,
                                        )!.deleteManifest,
                                      ),
                                    )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

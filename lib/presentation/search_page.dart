import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/blocs/add_game/addgame_cubit.dart';
import 'package:steampass/blocs/home/home_cubit.dart';
import 'package:steampass/core/service_locator.dart';
import 'package:steampass/l10n/generated/app_localizations.dart';
import 'package:steampass/utils/constants/colors.dart';
import '../blocs/search/search_cubit.dart';
import 'package:steampass/domain/data/models/steam_search_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  void searchChanged(String value, BuildContext context) {
    context.read<SearchCubit>().debounceTimeSearch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Dark background color
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      // color: Colors.transparent,
      child: Stack(children: [SearchView(), _buildFloatingSearchBar(context)]),
    );
  }

  Widget _buildFloatingSearchBar(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: Acrylic(
          blurAmount: 20,
          tint: FluentTheme.of(context).cardColor,
          luminosityAlpha: 0.6,

          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: FluentTheme.of(context).cardColor,
              width: 0.5,
            ),
          ),
          shadowColor: Colors.transparent,
          tintAlpha: 100,
          child: Container(
            height: 45,
            decoration: BoxDecoration(color: Colors.transparent),
            child: TextBox(
              placeholder: AppLocalizations.of(context)!.searchGameHint,
              controller: context.read<SearchCubit>().state.searchController,
              placeholderStyle: FluentTheme.of(
                context,
              ).typography.caption!.copyWith(fontSize: 14, height: 0.8),

              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              prefix: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Icon(FluentIcons.search, size: 18),
              ),
              prefixMode: OverlayVisibilityMode.always,
              highlightColor: Colors.transparent,
              unfocusedColor: Colors.transparent,
              style: FluentTheme.of(
                context,
              ).typography.body!.copyWith(height: 1),
              decoration: WidgetStatePropertyAll(
                BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),

                  shape: BoxShape.rectangle,
                  boxShadow: null,
                ),
              ),
              onChanged: (value) {
                searchChanged(value, context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return Center(child: ProgressRing());
        } else if (state.status.isError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.errorMessage == 'noResultsFound'
                    ? AppLocalizations.of(context)!.noResultsFound
                    : state.errorMessage!,
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state.status.isLoadedBasicSearch) {
          var games = state.searchResult;

          return LayoutBuilder(
            builder: (context, constraints) {
              int columns = (constraints.maxWidth / 250).floor();

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,

                  mainAxisExtent: 280,
                  // crossAxisSpacing: 10,
                ),
                padding: const EdgeInsets.only(top: 60, left: 5, right: 5),
                physics: const BouncingScrollPhysics(),
                itemCount: games!.total,

                itemBuilder: (context, index) {
                  final game = games.items![index];

                  return GameContainer(game: game);
                },
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class GameContainer extends StatefulWidget {
  final GameItem game;
  const GameContainer({super.key, required this.game});

  @override
  State<GameContainer> createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {
  bool isHovered = false;
  bool havePrice = true;
  String priceConvert(var price) {
    if (price == null) return 'Free';
    if (price.priceFinal == 0) return 'Free';
    return '${price.priceFinal / 100} \$';
  }

  @override
  void initState() {
    if (priceConvert(widget.game.price) == 'Free') {
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
    // print(getIt<HomeCubit>().state);
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
                          imageUrl: widget.game.tinyImage!,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.fill,

                          errorWidget: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 120,
                              color:
                                  getIt<HomeCubit>().state.isDark
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
                                  getIt<HomeCubit>().state.isDark
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
                                      // Copy the game ID to clipboard
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
                                    ? FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: FilledButton(
                                        style:
                                            FluentTheme.of(
                                              context,
                                            ).buttonTheme.filledButtonStyle,
                                        onPressed: () {
                                          return context
                                              .read<AddGameCubit>()
                                              .searchGame(context, widget.game);
                                        },

                                        child: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.unlockManifest,
                                        ),
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

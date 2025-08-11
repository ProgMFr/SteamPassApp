import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/utils/constants/colors.dart';
import 'package:steampass/utils/constants/font.dart';
import 'package:steampass/utils/themes/widgets/filled_button_theme.dart';

final FluentThemeData lightTheme = FluentThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.grey,
  accentColor: Colors.orange,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  navigationPaneTheme: NavigationPaneThemeData(
    backgroundColor: Color(0xffFFFFFF).withAlpha(180),
  ),

  cardColor: AppColors.cardColorLight,
  shadowColor: AppColors.lightPurple,
  buttonTheme: ButtonThemeData(filledButtonStyle: filledButtonLightStyle),

  typography: typographyStyle(),
);

Typography typographyStyle() {
  return const Typography.raw(
    caption: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.captionFontSize,
      color: AppColors.black64,
    ),
    body: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.bodyFontSize,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    bodyStrong: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.bodyStrongFontSize,
      fontWeight: FontWeight.bold,
    ),
    subtitle: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.subtitleFontSize,
    ),
    title: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.titleFontSize,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.titleLargeFontSize,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    display: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.displayFontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/utils/constants/colors.dart';
import 'package:steampass/utils/themes/widgets/filled_button_theme.dart';

import '../constants/font.dart';

final FluentThemeData darkTheme = FluentThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff121212),
  accentColor: Colors.orange,

  visualDensity: VisualDensity.adaptivePlatformDensity,
  navigationPaneTheme: NavigationPaneThemeData(
    backgroundColor: Color(0xff121212).withAlpha(180),
  ),

  cardColor: AppColors.cardColorDark,
  shadowColor: Color(0xFF7C4DFF),
  buttonTheme: ButtonThemeData(filledButtonStyle: filledButtonDarkStyle),

  typography: typographyStyles(),
);

Typography typographyStyles() {
  return const Typography.raw(
    caption: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.captionFontSize,
      color: Color(0x89FFFFFF),
    ),
    body: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.bodyFontSize,
      color: Colors.white,
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
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.titleLargeFontSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    display: TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: FontConstants.displayFontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

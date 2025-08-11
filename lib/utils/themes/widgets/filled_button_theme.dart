import 'package:fluent_ui/fluent_ui.dart';
import 'package:steampass/utils/constants/colors.dart';
import 'package:steampass/utils/constants/font.dart';

final ButtonStyle filledButtonLightStyle = ButtonStyle(
  padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
  backgroundColor: WidgetStateProperty.resolveWith<Color>((
    Set<WidgetState> states,
  ) {
    if (states.isHovered) {
      return AppColors.orangeAccent.withAlpha(50);
    }
    if (states.isPressed) {
      return AppColors.orange;
    }
    return Colors.transparent;
  }),
  foregroundColor: WidgetStateProperty.resolveWith<Color>((
    Set<WidgetState> states,
  ) {
    if (states.contains(WidgetState.pressed)) {
      return Colors.black;
    }
    if (states.contains(WidgetState.hovered)) {
      return AppColors.orange;
    }
    return AppColors.orange;
  }),

  shadowColor: WidgetStateProperty.all(null),
  elevation: WidgetStateProperty.all(0),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  textStyle: WidgetStatePropertyAll(
    TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final ButtonStyle filledButtonDarkStyle = ButtonStyle(
  padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
  backgroundColor: WidgetStateProperty.resolveWith((states) {
    if (states.isHovered) {
      return AppColors.orangeAccent.withAlpha(50);
    }
    if (states.isPressed) {
      return AppColors.orange;
    }
    return Colors.transparent;
  }),
  foregroundColor: WidgetStateProperty.resolveWith((states) {
    if (states.isPressed) {
      return Colors.white;
    }
    if (states.isHovered) {
      return AppColors.orange;
    }
    return AppColors.orange;
  }),
  shadowColor: WidgetStateProperty.all(null),
  elevation: WidgetStateProperty.all(0),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),

  textStyle: WidgetStatePropertyAll(
    TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  ),
);

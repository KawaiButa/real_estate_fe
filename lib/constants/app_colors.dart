import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppColors {
  // Main palette:
  // #000B58 (navy), #003161 (dark navy), #006A67 (teal), #FFF4B7 (pastel yellow)

  static Color get cancelledColor => Vx.hexToColor("#808080");

  // Primary brand colors
  static Color get primaryColor => Vx.hexToColor("#000B58");
  static Color get primaryColorDark => Vx.hexToColor("#003161");

  // Accent (teal)
  static Color get accentColor => Vx.hexToColor("#006A67");

  // A nice pastel yellow highlight
  static Color get highlightColor => Vx.hexToColor("#FFF4B7");

  // Cursor color (often good to match accent)
  static Color get cursorColor => accentColor;

  // Faint background color
  static Color get faintBgColor {
    // Example of checking brightness to pick a background color:
    try {
      final isLightMode = ThemeData.estimateBrightnessForColor(Colors.white) ==
          Brightness.light;
      return isLightMode
          ? Vx.hexToColor("#FFFDF9") // or #FFF4B7 if you want it more visible
          : Vx.hexToColor("#212121");
    } catch (error) {
      return Colors.white;
    }
  }

  // If you want a MaterialColor for primary swatches:
  static MaterialColor get primaryMaterialColor =>
      _createMaterialColor(primaryColor);

  /// Helper to generate a MaterialColor from a Color
  static MaterialColor _createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.r.toInt(), g = color.g.toInt(), b = color.b.toInt();

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.toARGB32(), swatch);
  }
}

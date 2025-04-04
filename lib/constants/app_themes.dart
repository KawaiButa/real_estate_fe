import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_fe/constants/app_colors.dart';

class AppTheme {
  //
  ThemeData lightTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.roboto().fontFamily,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColorDark,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: AppColors.cursorColor, // from our teal
        selectionHandleColor: Colors.transparent,
      ),
      cardColor: Colors.grey[50],
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      dialogTheme: const DialogThemeData(backgroundColor: Colors.white),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      highlightColor: Colors.grey[400],
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor, // #000B58
        secondary: AppColors.accentColor, // #006A67
        brightness: Brightness.light,
        surface: AppColors.highlightColor, // #FFF4B7 (pastel highlight)
      ).copyWith(
        // If you want a MaterialColor for your primary
        primary: AppColors.primaryMaterialColor,
      ),
      dividerColor: Colors.grey.shade200,
    );
  }

  //
  ThemeData darkTheme() {
    return ThemeData(
      fontFamily: GoogleFonts.roboto().fontFamily,
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColorDark,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.grey,
        cursorColor: AppColors.cursorColor,
        selectionHandleColor: Colors.transparent,
      ),
      cardColor: Colors.grey[700],
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            primary: AppColors.primaryColor,
            secondary: AppColors.accentColor,
            brightness: Brightness.dark,
            surface: Colors.grey[850],
          )
          .copyWith(
            primary: AppColors.primaryMaterialColor,
          ),
    );
  }
}

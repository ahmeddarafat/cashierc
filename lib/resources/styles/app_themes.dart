import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';


class AppThemes {
  AppThemes._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: "Roboto",

    /// Colors
    scaffoldBackgroundColor: Colors.white,
    colorScheme:  ColorScheme.fromSeed(
      seedColor: AppColors.orangePrimary,
    ),

    /// App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light, // IOS
        statusBarColor: Colors.white, // Andriod
        statusBarIconBrightness: Brightness.dark, // Android
      ),
    ),
    /// Card Theme
    cardTheme: const CardTheme(color: Colors.white),
  );
}

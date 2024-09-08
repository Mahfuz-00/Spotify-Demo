import 'package:flutter/material.dart';
import 'package:spotify_demo/Core/Configurations/Themes/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      fontFamily: 'Satoshi',
      scaffoldBackgroundColor: AppColors.lightBackground,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        contentPadding: EdgeInsets.all(30),
        hintStyle: TextStyle(
            color: Color(0xff383838),
            fontWeight: FontWeight.w500,
            fontSize: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ));

  /// The reason foregroundColor is still needed even when you're specifying the text color inside
  /// TextStyle is because of how ElevatedButton (and buttons in general in Flutter)
  /// prioritize their style properties.

  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      scaffoldBackgroundColor: AppColors.darkBackground,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        contentPadding: EdgeInsets.all(30),
        hintStyle: TextStyle(
            color: Color(0xffA7A7A7),
            fontWeight: FontWeight.w500,
            fontSize: 17),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ));
}

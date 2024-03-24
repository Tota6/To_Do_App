import 'package:flutter/material.dart';
import 'package:todo_app/config/themes/app_colors.dart';

class AppThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimaryColor,
      toolbarHeight: 170,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.lightPrimaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.lightCardColor,
      selectedIconTheme: IconThemeData(
        color: AppColors.lightPrimaryColor,
        size: 40,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.unSelectedColor,
        size: 40,
      ),
    ),
    colorScheme: ColorScheme(
      background: AppColors.lightBackgroundColor,
      primary: AppColors.lightPrimaryColor,
      brightness: Brightness.light,
      onPrimary: AppColors.lightBackgroundColor,
      secondary: AppColors.lightSecondaryTextColor,
      onSecondary: AppColors.lightSecondaryTextColor,
      error: AppColors.deletedBackgroundColor,
      onError: AppColors.deletedBackgroundColor,
      onBackground: AppColors.lightBackgroundColor,
      surface: AppColors.lightBackgroundColor,
      onSurface: AppColors.lightBackgroundColor,
    ),
    textTheme: TextTheme(
      bodyMedium: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      labelLarge: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: AppColors.lightPrimaryColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: AppColors.lightPrimaryTextColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColors.lightPrimaryTextColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.lightCardColor,
      ),
      titleSmall: TextStyle(
        //black
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightPrimaryTextColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryColor,
      toolbarHeight: 170,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.darkPrimaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.darkCardColor,
      selectedIconTheme: IconThemeData(
        color: AppColors.darkAppBarColor,
        size: 40,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.unSelectedColor,
        size: 40,
      ),
    ),
    colorScheme: ColorScheme(
      background: AppColors.darkBackgroundColor,
      primary: AppColors.darkPrimaryColor,
      brightness: Brightness.dark,
      onPrimary: AppColors.darkBackgroundColor,
      secondary: AppColors.darkPrimaryTextColor,
      onSecondary: AppColors.darkSecondaryTextColor,
      error: AppColors.deletedBackgroundColor,
      onError: AppColors.deletedBackgroundColor,
      onBackground: AppColors.darkBackgroundColor,
      surface: AppColors.darkBackgroundColor,
      onSurface: AppColors.darkBackgroundColor,
    ),
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          //white
          color: AppColors.darkPrimaryTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
          color: AppColors.darkPrimaryTextColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          //white
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.darkCardColor,
        ),
        titleMedium: TextStyle(
          //white
          color: AppColors.darkPrimaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          //black
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.darkPrimaryTextColor,
        )),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/hex_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.secondary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    scaffoldBackgroundColor: HexColor("1b1d21"),
    appBarTheme: AppBarTheme(
      shadowColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0.0,
      backgroundColor: HexColor("929395"),
      titleTextStyle: TextStyle(
          color: HexColor("be9c53"), fontSize: 15, fontWeight: FontWeight.bold),
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.grey),
    ),
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

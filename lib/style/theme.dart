import 'package:flutter/material.dart';
import 'package:todo_list_3/style/app_color.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.primaryLightColor,
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primaryLightColor,
      primary: AppColor.primaryLightColor,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
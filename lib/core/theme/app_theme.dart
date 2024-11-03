import 'package:flutter/material.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/theme/input_decoration_theme.dart';
import 'package:voyai/core/theme/text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfaceColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.labelLarge,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.surfaceColor,
    textTheme: textTheme,
  );
}

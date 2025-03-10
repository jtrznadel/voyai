import 'package:flutter/material.dart';
import 'package:voyai/core/constants/colors.dart';
import 'package:voyai/core/theme/text_theme.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: AppColors.surfaceColor,
      width: 1,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
      width: 2,
    ),
  ),
  errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
      width: 2,
    ),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
      width: 2,
    ),
  ),
  disabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      color: AppColors.surfaceColor,
      width: 2,
    ),
  ),
  labelStyle: textTheme.bodyMedium,
  hintStyle: textTheme.bodyMedium?.copyWith(color: const Color(0xFF8391A1)),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  filled: true,
  fillColor: AppColors.primaryColor,
);

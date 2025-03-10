import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voyai/core/constants/colors.dart';

TextTheme textTheme = TextTheme(
  headlineLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      height: 1.2,
      color: AppColors.textPrimary),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: AppColors.textPrimary),
  headlineSmall: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      height: 1.2,
      color: AppColors.textPrimary),
  bodyLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.textPrimary),
  bodyMedium: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.textPrimary),
  bodySmall: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.textPrimary),
  labelLarge: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
  labelMedium: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
  labelSmall: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.cardBg,
      background: AppColors.background,
      error: AppColors.error,
      onPrimary: AppColors.textLight,
      onSecondary: AppColors.textLight,
      onSurface: AppColors.textPrimary,
      onBackground: AppColors.textPrimary,
      onError: AppColors.textLight,
    ),
    textTheme: GoogleFonts.nunitoTextTheme().copyWith(
      headlineLarge: GoogleFonts.nunito(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.lato(fontSize: 16),
      bodyMedium: GoogleFonts.lato(fontSize: 14),
      labelSmall: GoogleFonts.lato(fontSize: 12, color: Colors.grey[600]),
    ),
    useMaterial3: true,
  );
}

ThemeData buildDarkTheme() {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Color(0xFF1A1F36),
      background: Color(0xFF0F1424),
      error: AppColors.error,
      onPrimary: AppColors.textLight,
      onSecondary: AppColors.textLight,
      onSurface: AppColors.textLight,
      onBackground: AppColors.textLight,
      onError: AppColors.textLight,
    ),
    textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme).copyWith(
      headlineLarge: GoogleFonts.nunito(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.lato(fontSize: 16),
      bodyMedium: GoogleFonts.lato(fontSize: 14),
      labelSmall: GoogleFonts.lato(fontSize: 12, color: Colors.grey[400]),
    ),
    useMaterial3: true,
  );
}

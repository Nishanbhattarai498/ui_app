import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFB2A4FF),
      brightness: Brightness.light,
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
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFB2A4FF),
      brightness: Brightness.dark,
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

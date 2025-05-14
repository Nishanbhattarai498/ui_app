import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const primary = Color(0xFF4776E6); // Electric Blue
  static const secondary = Color(0xFF8E54E9); // Bright Purple
  static const accent = Color(0xFF00E5FF); // Cyan

  // Background Colors
  static const background = Color(0xFFFAFBFF); // Light Blue-tinted White
  static const cardBg = Colors.white;
  static const surfaceLight = Color(0xFFEEF2FF); // Light Blue Surface

  // Text Colors
  static const textPrimary = Color(0xFF2C1810); // Rich Dark
  static const textSecondary = Color(0xFF4F566B); // Medium Gray
  static const textLight = Color(0xFFFFFFFF); // Pure White

  // Accent Colors
  static const success = Color(0xFF00C853); // Green
  static const warning = Color(0xFFFFAB00); // Amber
  static const error = Color(0xFFFF5252); // Red
  static const info = Color(0xFF00B8D4); // Light Blue

  // Gradient Colors
  static const gradientStart = Color(0xFF4776E6); // Electric Blue
  static const gradientMiddle = Color(0xFF8E54E9); // Bright Purple
  static const gradientEnd = Color(0xFF00E5FF); // Cyan
}

class AppGradients {
  static const mainGradient = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardGradient = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientMiddle],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const accentGradient = LinearGradient(
    colors: [AppColors.gradientMiddle, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

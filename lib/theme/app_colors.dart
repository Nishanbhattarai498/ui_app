import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const primary = Color(0xFF2C3E50); // Dark Blue
  static const secondary = Color(0xFF6C5CE7); // Deep Purple
  static const accent = Color(0xFF00B4D8); // Deep Cyan

  // Background Colors
  static const background = Color(0xFF1A1A2E); // Dark Blue-tinted Black
  static const cardBg = Color(0xFF2D3436); // Dark Gray
  static const surfaceLight = Color(0xFF34495E); // Dark Blue Surface

  // Text Colors
  static const textPrimary = Color(0xFFFFFFFF); // Pure White
  static const textSecondary = Color(0xFFB2BEC3); // Light Gray
  static const textLight = Color(0xFFFFFFFF); // Pure White

  // Accent Colors
  static const success = Color(0xFF00B894); // Dark Green
  static const warning = Color(0xFFFDAA5D); // Dark Amber
  static const error = Color(0xFFE17055); // Dark Red
  static const info = Color(0xFF0984E3); // Dark Blue

  // Gradient Colors
  static const gradientStart = Color(0xFF2C3E50); // Dark Blue
  static const gradientMiddle = Color(0xFF6C5CE7); // Deep Purple
  static const gradientEnd = Color(0xFF00B4D8); // Deep Cyan
}

class AppGradients {
  static const mainGradient = LinearGradient(
    colors: [
      AppColors.gradientStart,
      AppColors.gradientMiddle,
      AppColors.gradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const cardGradient = LinearGradient(
    colors: [
      AppColors.gradientStart,
      Color(0xFF373B44), // Dark slate
      AppColors.gradientMiddle,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const accentGradient = LinearGradient(
    colors: [
      AppColors.gradientMiddle,
      Color(0xFF373B44), // Dark slate
      AppColors.gradientEnd,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const primary = Color(0xFF2D3250); // Rich Navy
  static const secondary = Color(0xFF7C4DFF); // Vibrant Purple
  static const accent = Color(0xFF00BCD4); // Bright Cyan

  // Background Colors
  static const background = Color(0xFF121829); // Deep Space Blue
  static const cardBg = Color(0xFF1E2433); // Dark Slate
  static const surfaceLight = Color(0xFF2A3142); // Medium Slate

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
  static const gradientStart = Color(0xFF2D3250); // Rich Navy
  static const gradientMiddle = Color(0xFF424874); // Deep Indigo
  static const gradientEnd = Color(0xFF7C4DFF); // Vibrant Purple
}

class AppGradients {
  static const mainGradient = LinearGradient(
    colors: [
      Color(0xFF2D3250),  // Rich Navy
      Color(0xFF424874),  // Deep Indigo
      Color(0xFF7C4DFF),  // Vibrant Purple
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0],
  );

  static const cardGradient = LinearGradient(
    colors: [
      Color(0xFF1E2433),  // Dark Slate
      Color(0xFF2A3142),  // Medium Slate
      Color(0xFF424874),  // Deep Indigo
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 0.4, 1.0],
  );

  static const accentGradient = LinearGradient(
    colors: [
      Color(0xFF7C4DFF),  // Vibrant Purple
      Color(0xFF424874),  // Deep Indigo
      Color(0xFF00BCD4),  // Bright Cyan
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.6, 1.0],
  );
}

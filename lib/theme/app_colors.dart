import 'package:flutter/material.dart';

class AppColors {
  static const lavender = Color(0xFFE6E6FA);
  static const skyBlue = Color(0xFFB2D8FF);
  static const mint = Color(0xFFB9F3E4);
  static const lightPeach = Color(0xFFFFE5B4);
  static const softPurple = Color(0xFFE0C3FC);
  static const mistyBlue = Color(0xFF8EC5FC);
  static const sageGreen = Color(0xFFA1FFCE);
  static const softPeach = Color(0xFFF9F9D2);
}

class AppGradients {
  static const mainBackground = LinearGradient(
    colors: [
      AppColors.lavender,
      AppColors.skyBlue,
      AppColors.mint,
      AppColors.lightPeach,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const featuredCard = LinearGradient(
    colors: [AppColors.softPurple, AppColors.mistyBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const yogaCard = LinearGradient(
    colors: [AppColors.softPeach, AppColors.sageGreen],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}

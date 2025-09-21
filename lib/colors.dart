import 'package:flutter/material.dart';

class Screensize {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

// Dark theme colors for Legal App
class MyColors {
  // Backgrounds
  static const Color background = Color(0xFF000000); // Pure black background
  static const Color cardBackground = Color(
    0xFF111111,
  ); // Slightly lighter black for cards/boxes
  static const Color dialogBackground = Color(
    0xFF1A1A1A,
  ); // Modals / BottomSheets
  static const Color extra2 = Color(0xFFD2D9F3);
  // Primary colors (for buttons, highlights)
  static const Color primary = Color(0xFF005C5C); // Sophisticated teal
  static const Color primaryLight = Color(0xFF00B3B3);
  static const Color primaryDark = Color(0xFF006666);

  // Secondary colors (for accents, icons)
  static const Color secondary = Color(0xFF6C757D); // Grayish accent color
  static const Color secondaryLight = Color(0xFFADB5BD);
  static const Color secondaryDark = Color(0xFF495057);

  // Text Colors
  static const Color textPrimary = Color(0xFFF5F0FF); // White for main text
  static const Color textSecondary = Color(
    0xFFCCCCCC,
  ); // Slightly gray for secondary text
  static const Color textHint = Color(0xFF888888); // Hint/placeholder text
  static const Color textDisabled = Color(
    0xFF555555,
  ); // Disabled/less important text
  static const Color gradient = Color(0xFF3A86FF);

  // Alerts / Special
  static const Color success = Color(0xFF28A745);
  static const Color error = Color(0xFFDC3545);
  static const Color warning = Color(0xFFFFC107);

  // Divider / Borders
  static const Color border = Color(0xFF333333);
  static const Color divider = Color(0xFF222222);
}

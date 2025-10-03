import 'package:flutter/material.dart';

abstract class AppTheme {
  // Your color constants remain the same. This is excellent practice.
  //brand colors
  static const Color primary = Color(0xFF004D40);
  static const Color secondary = Color(0xFF4CAF50);

  //state color
  static const Color info = Color(0xFF2F80ED);
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFE2B93B);
  static const Color error = Color(0xFFEB5757);

  //black colors
  static const Color black = Color(0xFF000000);
  static const Color black1 = Color(0xFF1D1D1D);
  static const Color black2 = Color(0xFF282828);
  //white colors
  static const Color white = Color(0xFFFAFAFA);
  //grey colors
  static const Color gray = Color(0xFF333333);
  static const Color gray1 = Color(0xFF4F4F4F);
  static const Color gray2 = Color(0xFF828282);
  static const Color gray3 = Color(0xFFBDBDBD);
  static const Color gray4 = Color(0xFFE0E0E0);

  // --- LIGHT THEME (Excellent as is) ---
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: primary,
    brightness: Brightness.light,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      secondary: secondary,
      surface: white,
      error: error,
      onPrimary: white,
      onSecondary: white,
      onSurface: black1,
      onError: white,
    ),
    appBarTheme: AppBarTheme(backgroundColor: primary, foregroundColor: white),
    textTheme: TextTheme(

    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),

    
  );

  // --- DARK THEME (Refactored for Consistency) ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Use your brand colors to create a dark color scheme
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: primary, // Your brand's teal color
      secondary: secondary, // Your brand's green color
      surface: black2, // Dark surface color
      error: error, // Your brand's error color
      onPrimary: white, // Text on top of primary
      onSecondary: white, // Text on top of secondary
      onSurface: white, // Main text color for dark theme
      onError: white,
    ),
    // Link component themes to the new dark color scheme
    appBarTheme: AppBarTheme(
      backgroundColor: black2, // A common dark theme pattern
      foregroundColor: white,
    ),
    // Ensure button styles are consistent in shape and size, just adapted for color
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            primary, // Keep the primary brand color for main actions
        foregroundColor: white, // Text on the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ), // Same shape as light theme
        ),
        minimumSize: const Size(
          double.infinity,
          50,
        ), // Same size as light theme
        textStyle: const TextStyle(
          fontSize: 18, // Same text style as light theme
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: gray3), // Use lighter grey for body text
      titleLarge: TextStyle(color: white),
    ),
  );
}

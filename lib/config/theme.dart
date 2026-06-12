import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1A73E8);
  static const Color accentColor = Color(0xFFFF6B35);
  static const Color successColor = Color(0xFF00BCD4);
  static const Color errorColor = Color(0xFFE53935);

  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primaryColor,
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primaryColor,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF1E1E1E),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
    ),
  );
}

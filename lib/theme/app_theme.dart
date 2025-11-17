import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color(0xFF6366F1),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    cardColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Color(0xFF6366F1),
      secondary: Color(0xFF10B981),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF6366F1),
    scaffoldBackgroundColor: Color(0xFF1F2937),
    cardColor: Color(0xFF374151),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF6366F1),
      secondary: Color(0xFF10B981),
    ),
  );
}

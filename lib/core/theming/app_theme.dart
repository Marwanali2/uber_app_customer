import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey.shade200,

    colorScheme: const ColorScheme.light(
      secondary: Colors.white,
      onSecondary: Colors.black,
      surface: Colors.white,
    ),
    //  appBarTheme: const AppBarTheme(
    //    backgroundColor: Colors.white,
    //    elevation: 0,
    //    iconTheme: IconThemeData(
    //      color: Colors.black,
    //    ),
    //  ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(
      secondary: Colors.black,
      onSecondary: Colors.white,
      surface: Colors.black,
    ),
    //  appBarTheme: const AppBarTheme(
    //    backgroundColor: Colors.black,
    //    elevation: 0,
    //    iconTheme: IconThemeData(
    //      color: Colors.white,
    //    ),
    //  ),
  );
}

import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ),
  );
}

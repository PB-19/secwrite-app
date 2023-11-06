import 'package:flutter/material.dart';
import '../constants/typography.dart';

class ApplicationTheme {
  ApplicationTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: ApplicationTextTheme.lightTextTheme,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: ApplicationTextTheme.darkTextTheme,
    useMaterial3: true,
  );
}

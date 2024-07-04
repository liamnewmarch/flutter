import 'package:flutter/material.dart';
import 'colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light().copyWith(
    brightness: Brightness.light,
    // Surface (black on white)
    surface: Colors.white,
    onSurface: black,
    // Primary (white on purple)
    primary: purple,
    onPrimary: Colors.white,
    // Secondary (white on pink)
    secondary: pink,
    onSecondary: Colors.white,
    // Tertiary (black on yellow)
    tertiary: yellow,
    onTertiary: black,
  ),
  useMaterial3: true,
);

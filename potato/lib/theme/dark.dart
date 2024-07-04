import 'package:flutter/material.dart';
import 'colors.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    // Surface (black on white)
    surface: black,
    onSurface: Colors.white,
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

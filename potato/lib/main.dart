import 'package:flutter/material.dart';
import 'content/global.dart';
import 'pages/home.dart';
import 'theme/dark.dart';
import 'theme/light.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(),
    );
  }
}

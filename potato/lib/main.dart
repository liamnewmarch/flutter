import 'package:flutter/material.dart';

import 'content/global.dart';
import 'pages/home.dart';
import 'theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: purple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

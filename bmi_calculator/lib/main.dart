import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/input.dart';
import 'package:bmi_calculator/theme/colors.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark().copyWith(
          background: BMIColors.darkBackground,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: BMIColors.darkBackground,
        ),
      ),
      home: const InputPage(),
    );
  }
}

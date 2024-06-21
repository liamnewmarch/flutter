import 'package:bmi_calculator/theme/colors.dart';
import 'package:flutter/material.dart';

class BMITextStyle {
  static const bmi = TextStyle(
    fontSize: 100,
    fontWeight: FontWeight.w900,
  );

  static const body = TextStyle(
    fontSize: 22,
  );

  static const label = TextStyle(
    fontSize: 18,
    color: BMIColors.midGrey,
  );

  static const largeButton = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const number = TextStyle(
    fontSize: 50,
    fontFeatures: [FontFeature.tabularFigures()],
    fontWeight: FontWeight.w900,
  );

  static const result = TextStyle(
    color: BMIColors.ok,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const title = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
}

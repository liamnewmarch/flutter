import 'package:bmi_calculator/theme/colors.dart';
import 'package:bmi_calculator/theme/styles.dart';
import 'package:flutter/material.dart';

class BMICalculate extends StatelessWidget {
  const BMICalculate(
    this.label, {
    this.child,
    this.color,
    this.onPressed,
    super.key,
  });

  final Widget? child;
  final Color? color;
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: color ?? BMIColors.accent,
        height: 80,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        child: Center(child: Text(label, style: BMITextStyle.largeButton)),
      ),
    );
  }
}

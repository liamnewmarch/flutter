import 'package:flutter/material.dart';
import 'package:bmi_calculator/theme/colors.dart';

class BMIFooter extends StatelessWidget {
  const BMIFooter({
    this.child,
    this.color,
    super.key,
  });

  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? BMIColors.accent,
      margin: const EdgeInsets.only(top: 10),
      height: 80,
      width: double.infinity,
      child: child,
    );
  }
}

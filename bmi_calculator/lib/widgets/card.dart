import 'package:flutter/material.dart';
import 'package:bmi_calculator/theme/colors.dart';

class BMICard extends StatelessWidget {
  const BMICard({
    this.child,
    this.color,
    this.onPress,
    super.key,
  });

  final Widget? child;
  final Color? color;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? BMIColors.darkActiveCard,
        ),
        child: child,
      ),
    );
  }
}

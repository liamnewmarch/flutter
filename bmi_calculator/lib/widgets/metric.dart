import 'package:bmi_calculator/theme/colors.dart';
import 'package:bmi_calculator/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMIMetric extends StatelessWidget {
  const BMIMetric(
    this.label,
    this.value, {
    required this.onChanged,
    super.key,
  });

  final String label;
  final void Function(int) onChanged;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: BMITextStyle.label),
        Text('$value', style: BMITextStyle.number),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BMIIconButton(
              FontAwesomeIcons.minus,
              backgroundColor: BMIColors.buttonBackground,
              color: Colors.white,
              onPressed: () {
                onChanged(value - 1);
              },
            ),
            const SizedBox(width: 10),
            BMIIconButton(
              FontAwesomeIcons.plus,
              backgroundColor: BMIColors.buttonBackground,
              color: Colors.white,
              onPressed: () {
                onChanged(value + 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class BMIIconButton extends StatelessWidget {
  const BMIIconButton(
    this.icon, {
    this.backgroundColor,
    this.color,
    this.onPressed,
    super.key,
  });

  final Color? backgroundColor;
  final Color? color;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      elevation: 6,
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: backgroundColor,
      child: Icon(icon, color: color),
    );
  }
}

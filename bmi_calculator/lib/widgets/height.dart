import 'package:bmi_calculator/theme/colors.dart';
import 'package:bmi_calculator/theme/styles.dart';
import 'package:flutter/material.dart';

class BMIHeight extends StatelessWidget {
  const BMIHeight({
    required this.label,
    required this.units,
    required this.value,
    required this.max,
    required this.min,
    this.onChanged,
    super.key,
  });

  final void Function(double)? onChanged;
  final String label;
  final String units;
  final int value;
  final int max;
  final int min;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: BMITextStyle.labelTextStyle),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('$value', style: BMITextStyle.numberTextStyle),
            Text(units, style: BMITextStyle.labelTextStyle),
          ],
        ),
        Slider(
          onChanged: onChanged,
          activeColor: BMIColors.accent,
          max: max.toDouble(),
          min: min.toDouble(),
          value: value.toDouble(),
        ),
      ],
    );
  }
}

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
        Text(label, style: BMITextStyle.label),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('$value', style: BMITextStyle.number),
            Text(units, style: BMITextStyle.label),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: BMIColors.midGrey,
            overlayColor: BMIColors.accent.withAlpha(0x29),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 30,
            ),
            thumbColor: BMIColors.accent,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 15,
            ),
            trackHeight: 1,
          ),
          child: Slider(
            onChanged: onChanged,
            max: max.toDouble(),
            min: min.toDouble(),
            value: value.toDouble(),
          ),
        ),
      ],
    );
  }
}

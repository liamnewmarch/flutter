import 'package:bmi_calculator/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Sex {
  male,
  female,
}

class BMISex extends StatelessWidget {
  const BMISex(
    this.sex, {
    super.key,
  });

  final Sex sex;

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    final String label;

    switch (sex) {
      case Sex.male:
        icon = FontAwesomeIcons.mars;
        label = 'Male';
        break;
      case Sex.female:
        icon = FontAwesomeIcons.venus;
        label = 'Female';
        break;
      default:
        throw UnsupportedError('unknown sex $sex');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80),
        const SizedBox(height: 15),
        Text(label, style: BMITextStyle.labelTextStyle),
      ],
    );
  }
}

import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/theme/styles.dart';
import 'package:bmi_calculator/widgets/calculate.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.bmi,
    super.key,
  });

  final BMI bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Center(
              child: Text('Your result', style: BMITextStyle.title),
            ),
          ),
          Expanded(
            flex: 5,
            child: BMICard(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(bmi.classification(), style: BMITextStyle.result),
                    Text(bmi.toString(), style: BMITextStyle.bmi),
                    Text(
                      bmi.description(),
                      style: BMITextStyle.body,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          BMICalculate('Re-calculate', onPressed: () {
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}

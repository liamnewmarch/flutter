import 'package:bmi_calculator/bmi.dart';
import 'package:bmi_calculator/pages/result.dart';
import 'package:bmi_calculator/theme/colors.dart';
import 'package:bmi_calculator/widgets/calculate.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:bmi_calculator/widgets/height.dart';
import 'package:bmi_calculator/widgets/metric.dart';
import 'package:bmi_calculator/widgets/sex.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({
    super.key,
  });

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex? activeSex;
  int age = 18;
  int height = 180;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                for (var sex in Sex.values)
                  Expanded(
                    child: BMICard(
                      color: activeSex == sex
                          ? BMIColors.darkActiveCard
                          : BMIColors.darkInactiveCard,
                      onPress: () {
                        setState(() => activeSex = sex);
                      },
                      child: BMISex(sex),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: BMICard(
              child: BMIHeight(
                onChanged: (double value) {
                  setState(() => height = value.round());
                },
                label: 'Height',
                units: 'cm',
                max: 320,
                min: 40,
                value: height,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMICard(
                    child: BMIMetric('Weight', weight, onChanged: (int value) {
                      setState(() => weight = value);
                    }),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    child: BMIMetric('Age', age, onChanged: (int value) {
                      setState(() => age = value);
                    }),
                  ),
                ),
              ],
            ),
          ),
          BMICalculate('Calculate', onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(
                bmi: BMI(weight: weight, height: height),
              );
            }));
          }),
        ],
      ),
    );
  }
}

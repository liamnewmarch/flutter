import 'package:bmi_calculator/theme/colors.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:bmi_calculator/widgets/footer.dart';
import 'package:bmi_calculator/widgets/height.dart';
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
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          const Expanded(
            child: Row(
              children: [
                Expanded(child: BMICard()),
                Expanded(child: BMICard()),
              ],
            ),
          ),
          const BMIFooter(),
        ],
      ),
    );
  }
}

import 'dart:math';

enum BMIClassification {
  normal,
  overweight,
  underweight,
}

class BMI {
  BMI({
    required this.weight,
    required this.height,
  }) {
    _value = weight / pow(height / 100, 2);

    if (_value >= 25) {
      _classification = BMIClassification.overweight;
    } else if (_value <= 18.5) {
      _classification = BMIClassification.underweight;
    } else {
      _classification = BMIClassification.normal;
    }
  }

  final int height;
  final int weight;

  double _value = 0;
  BMIClassification _classification = BMIClassification.normal;

  @override
  String toString() {
    return _value.toStringAsFixed(1);
  }

  String classification() {
    switch (_classification) {
      case BMIClassification.overweight:
        return 'Overweight';
      case BMIClassification.underweight:
        return 'Underweight';
      default:
        return 'Normal';
    }
  }

  String description() {
    switch (_classification) {
      case BMIClassification.overweight:
        return 'You have a higher than normal body weight. Try to exercise more.';
      case BMIClassification.underweight:
        return 'You have a lower than normal body weight. Try to eat a bit more.';
      default:
        return 'You have a normal body weight. Good job!';
    }
  }
}

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({
    super.key,
  });

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    // final theme = ThemeData.from(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('BMI Calculator'),
      ),
      body: const Center(
        child: Text('Body Text'),
      ),
    );
  }
}

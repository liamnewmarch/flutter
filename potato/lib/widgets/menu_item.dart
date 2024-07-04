import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
    this.label, {
    this.active,
    this.onPressed,
    super.key,
  });

  final bool? active;
  final String label;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          print('Menu button clicked: $label');
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(24.0),
          fixedSize: const Size(168.0, 64.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active == true ? purple : black,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}

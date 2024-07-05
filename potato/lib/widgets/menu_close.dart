import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MenuClose extends StatelessWidget {
  const MenuClose({
    this.onPressed,
    super.key,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, bottom: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: const Size(64.0, 64.0),
          shape: const CircleBorder(side: BorderSide.none),
        ),
        child: const Icon(Icons.close, color: black, size: 32.0),
      ),
    );
  }
}

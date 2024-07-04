import 'package:flutter/material.dart';
import '../widgets/menu_close.dart';
import '../widgets/menu_item.dart';

final pages = [
  'Home',
  'Work',
  'Services',
  'Culture',
  'Careers',
  'Blog',
  'Contact',
];

class MenuPage extends StatelessWidget {
  const MenuPage({
    this.active,
    super.key,
  });

  final String? active;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          MenuClose(onPressed: () {
            Navigator.pop(context);
          }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (final page in pages) MenuItem(page, active: active == page),
            ],
          )
        ],
      ),
    );
  }
}

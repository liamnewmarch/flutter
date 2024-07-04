import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../content/global.dart';
import '../theme/colors.dart';

class Menu extends StatelessWidget {
  const Menu({
    this.onPressed,
    super.key,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.zero,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(48.0)),
                  color: purple,
                ),
                margin: const EdgeInsets.all(8.0),
                width: 48.0,
                height: 48.0,
                child: SvgPicture.asset(
                  'assets/svg/potato.svg',
                  width: 48.0,
                  height: 48.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0, right: 48.0),
                child: Text(menu,
                    style: TextStyle(
                      color: black,
                      fontSize: 24.0,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

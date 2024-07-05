import 'package:flutter/material.dart';
import '../content/global.dart';

class ConsultationBanner extends StatelessWidget {
  const ConsultationBanner({
    this.onPressed,
    this.backgroundColor,
    this.color,
    super.key,
  });

  final Color? backgroundColor;
  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: onPressed,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: consultationBannerParts.sublist(0, 4).join(' '),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: color,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.arrow_forward,
                      color: color,
                      size: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

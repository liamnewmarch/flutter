import 'package:flutter/material.dart';
import '../content/global.dart';

class ConsultationBanner extends StatelessWidget {
  const ConsultationBanner({
    this.onPressed,
    this.color,
    super.key,
  });

  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: consultationBannerParts.sublist(0, 4).join(' '),
              style: TextStyle(
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
    );
  }
}

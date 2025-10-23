import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_rich_text.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'Assets/images/app_logo.png',
          width: 120,
          height: 120,
          fit: BoxFit.contain,
        ),
        const SizedBox(width: 0),
        const CustomRichText(),
      ],
    );
  }
}

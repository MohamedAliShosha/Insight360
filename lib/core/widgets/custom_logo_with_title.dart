import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';

class CustomLogoWithTitle extends StatelessWidget {
  const CustomLogoWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'Assets/Images/logo 1 (1).png',
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

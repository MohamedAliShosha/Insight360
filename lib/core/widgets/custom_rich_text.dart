import 'package:flutter/material.dart';
import '../utils/colors_manager.dart';
import '../utils/styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // RichText is used to create a text widget with multiple styles
    return RichText(
      // TextSpan is used to create a span of text with a specific style
      text: TextSpan(
        children: [
          TextSpan(
            text: 'INSIGHT ',
            style: Styles.txtStyle24.copyWith(color: ColorsManager.kOrange),
          ),
          TextSpan(
            text: '360°',
            style: Styles.txtStyle24.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

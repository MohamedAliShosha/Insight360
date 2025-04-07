import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants.dart';

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
            style: GoogleFonts.inter(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: kOrange,
            ),
          ),
          TextSpan(
            text: '360°',
            style: GoogleFonts.inter(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: kPrimaryBlue,
            ),
          ),
        ],
      ),
    );
  }
}

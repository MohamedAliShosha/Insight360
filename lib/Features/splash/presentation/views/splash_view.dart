import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/Images/logo 1 (1).png',
              width: 120, // Adjust size as needed
              height: 120,
              fit: BoxFit.contain,
            ),
            // const SizedBox(width: 8), // Space between logo and text
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'INSIGHT ',
                    style: GoogleFonts.inter(
                      fontSize: 31,
                      fontWeight: FontWeight.w600,
                      color: kOrange,
                    ),
                  ),
                  // Text span is
                  TextSpan(
                    text: '360°',
                    style: GoogleFonts.inter(
                      fontSize: 31,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Adjusted to match design
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

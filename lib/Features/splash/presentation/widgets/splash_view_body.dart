import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants.dart';

class SplashViewBody extends StatelessWidget {
  final Animation<Offset> slidingAnimation;

  const SplashViewBody({super.key, required this.slidingAnimation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlue,
      body: Center(
        child: AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, child) {
            return SlideTransition(
              position: slidingAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'Assets/Images/logo 1 (1).png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'INSIGHT ',
                          style: GoogleFonts.inter(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                            color: kOrange,
                          ),
                        ),
                        TextSpan(
                          text: '360°',
                          style: GoogleFonts.inter(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

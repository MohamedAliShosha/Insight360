import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class SlidingAnimatedLogoText extends StatelessWidget {
  const SlidingAnimatedLogoText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
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
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'INSIGHT ',
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(
                      text: '360°',
                      style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

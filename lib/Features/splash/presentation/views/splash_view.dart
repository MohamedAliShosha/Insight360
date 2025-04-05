import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Features/Auth/presentation/views/sign_in_view.dart';
import 'package:news_app/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2), // Start from bottom
      end: Offset.zero, // Move to normal position
    ).animate(animationController);

    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const SignInView()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(slidingAnimation: slidingAnimation),
    );
  }
}

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
                            fontWeight: FontWeight.w600,
                            color: kOrange,
                          ),
                        ),
                        TextSpan(
                          text: '360°',
                          style: GoogleFonts.inter(
                            fontSize: 31,
                            fontWeight: FontWeight.w600,
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

import 'package:flutter/material.dart';

import 'package:news_app/Features/splash/presentation/widgets/splash_view_body.dart';
import 'package:news_app/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryBlue,
      body: SplashViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/splash_view_body.dart';

import '../../../../core/utils/colors_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.kPrimaryBlue,
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/presentation/widgets/sign_up_view_body.dart';

import 'package:news_app/core/utils/colors_manager.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsManager.kWhite,
      body: SignUpViewBody(),
    );
  }
}

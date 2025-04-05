import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/presentation/widgets/login_view_body.dart';
import 'package:news_app/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhite,
      body: LoginViewBody(),
    );
  }
}

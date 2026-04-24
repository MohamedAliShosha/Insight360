import 'package:flutter/material.dart';
import 'login_form.dart';
import '../../../../../core/widgets/logo_and_title.dart';
import '../../../../../core/widgets/dont_have_account.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoAndTitle(),
            SizedBox(
              height: 73,
            ),
            LoginForm(),
            SizedBox(
              height: 16,
            ),
            DontHaveAccount(),
          ],
        ),
      ),
    );
  }
}

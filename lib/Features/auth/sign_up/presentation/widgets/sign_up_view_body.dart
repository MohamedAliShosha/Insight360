import 'package:flutter/material.dart';
import 'already_have_account.dart';
import '../../../../../core/widgets/logo_and_title.dart';
import 'sign_up_form.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 16, left: 16, top: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoAndTitle(),
            SignUpForm(),
            SizedBox(
              height: 16,
            ),
            AlreadyHaveAccount(),
          ],
        ),
      ),
    );
  }
}

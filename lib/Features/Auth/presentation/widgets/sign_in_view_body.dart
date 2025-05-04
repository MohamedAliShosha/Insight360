import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_divider.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_field.dart';

import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';

// ignore: must_be_immutable
class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key, this.email, this.password, this.username});

  String? email, password, username;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 24),
      child: Form(
        key: formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true, // To make the ListView take only the space it needs
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Assets/Images/logo 1 (1).png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 0),
                    const CustomRichText(),
                  ],
                ),
                CustomTextField(
                  onChanged: (data) {
                    username = data;
                  },
                  hintText: 'Username',
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
                  isObscure: true,
                  // suffixIcon: Icon(Icons.visibility_off),
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text('Forget Password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsManager.kBlack,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 24,
                ),
                const CustomButtonWithoutImage(
                  textColor: ColorsManager.kWhite,
                  containerColor: ColorsManager.kPrimaryBlue,
                  leftPadding: 70,
                  rightPadding: 70,
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomDivider(
                  signUpOrSignIn: 'or sign in with',
                ),
                const SizedBox(
                  height: 16,
                ),
                // const CustomButtonWithOutImage(
                //   imagePath: 'Assets/Images/google.png',
                //   leftPadding: 10,
                //   rightPadding: 10,
                //   textColor: ColorsManager.kWhite,
                //   text: 'Continue with Google',
                //   containerColor: ColorsManager.kPrimaryBlue,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // const CustomButtonWithOutImage(
                //   imagePath: 'Assets/Images/facebook.png',
                //   leftPadding: 10,
                //   rightPadding: 10,
                //   textColor: ColorsManager.kWhite,
                //   text: 'Continue with Facebook',
                //   containerColor: ColorsManager.kPrimaryBlue,
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorsManager.kLightGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      // I need to manage the navigation using Routing
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kSignUpView);
                      },
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Register',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorsManager.kBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

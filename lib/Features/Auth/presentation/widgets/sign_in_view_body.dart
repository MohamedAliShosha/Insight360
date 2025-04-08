import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_with_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_divider.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
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
              const CustomTextField(
                hintText: 'Username',
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                hintText: 'Email',
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
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
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                child: const CustomButtonWithoutImage(
                  textColor: kWhite,
                  containerColor: kPrimaryBlue,
                  leftPadding: 70,
                  rightPadding: 70,
                  text: 'Sign In',
                ),
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
              const CustomButtonWithOutImage(
                imagePath: 'Assets/Images/google.png',
                leftPadding: 10,
                rightPadding: 10,
                textColor: kWhite,
                text: 'Continue with Google',
                containerColor: kPrimaryBlue,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomButtonWithOutImage(
                imagePath: 'Assets/Images/facebook.png',
                leftPadding: 10,
                rightPadding: 10,
                textColor: kWhite,
                text: 'Continue with Facebook',
                containerColor: kPrimaryBlue,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      color: kLightGrey,
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
                        color: kBlack,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_with_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_divider.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:news_app/Features/Auth/presentation/widgets/media_report_radio_button.dart';
import 'package:news_app/Features/Auth/presentation/widgets/visitor_radio_button.dart';

import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class SignUpViewBody extends StatefulWidget {
  // Changed to StatefulWidget
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // Use a string to track the selected option
  String? _selectedUserType; // Nullable to allow no selection

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
                hintText: 'Phone Number',
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                isObscure: true,
                hintText: 'Password',
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'I am a',
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorsManager.kLightGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Media Reporter radio button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedUserType =
                            "mediaReporter"; // Set the selected user type to "mediaReporter"
                      });
                    },
                    child: MediaReportRadioButton(
                        selectedUserType: _selectedUserType),
                  ),
                  const SizedBox(width: 30),

                  // Visitor radio button
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedUserType = "visitor";
                      });
                    },
                    child: VistitorRadioButton(
                        selectedUserType: _selectedUserType),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                child: const CustomButtonWithoutImage(
                  textColor: ColorsManager.kWhite,
                  containerColor: ColorsManager.kPrimaryBlue,
                  leftPadding: 70,
                  rightPadding: 70,
                  text: 'Sign Up',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomDivider(
                signUpOrSignIn: 'or sign up with',
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomButtonWithOutImage(
                imagePath: 'Assets/Images/google.png',
                leftPadding: 10,
                rightPadding: 10,
                textColor: ColorsManager.kWhite,
                text: 'Continue with Google',
                containerColor: ColorsManager.kPrimaryBlue,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomButtonWithOutImage(
                imagePath: 'Assets/Images/facebook.png',
                leftPadding: 10,
                rightPadding: 10,
                textColor: ColorsManager.kWhite,
                text: 'Continue with Facebook',
                containerColor: ColorsManager.kPrimaryBlue,
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                textAlign: TextAlign.center,
                'By Signing up to Insight 360, you are accepting our Terms & Conditions',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsManager.kBlack,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

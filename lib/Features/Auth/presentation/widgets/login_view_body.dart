import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:news_app/constants.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'INSIGHT ',
                      style: GoogleFonts.inter(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: kOrange,
                      ),
                    ),
                    TextSpan(
                      text: '360°',
                      style: GoogleFonts.inter(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
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
                  color: kLightGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: kPrimaryBlue,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: kWhite,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Media Reporter',
                style: TextStyle(
                  fontSize: 15,
                  color: kPrimaryBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 30),
              CircleAvatar(
                radius: 12,
                backgroundColor: kPrimaryBlue,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: kWhite,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Visitor',
                style: TextStyle(
                  fontSize: 15,
                  color: kPrimaryBlue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Sign Up',
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align items to top
                    children: [
                      Text(
                        '_____________',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          height: 1, // Tweak spacing
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Or sign in with',
                        style: TextStyle(
                          fontSize: 15,
                          color: kLightGrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '_____________',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

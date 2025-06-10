import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/core/widgets/custom_redirect_text.dart';

class CustomRedirectRow extends StatelessWidget {
  const CustomRedirectRow({
    super.key,
    required this.redirectTitle,
    required this.signUpOrSignIn,
    this.onTap,
  });

  final String redirectTitle;
  final String signUpOrSignIn;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          redirectTitle,
          style: Styles.txtStyleMedium14.copyWith(
            color: ColorsManager.kLightGrey,
          ),
        ),
        CustomRedirectText(
          onTap: onTap,
          text: signUpOrSignIn,
        ),
      ],
    );
  }
}

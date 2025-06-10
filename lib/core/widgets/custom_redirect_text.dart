import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/styles.dart';

class CustomRedirectText extends StatelessWidget {
  const CustomRedirectText({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // I need to manage the navigation using Routing
      onTap: onTap,
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: Styles.txtStyleMedium14.copyWith(color: ColorsManager.kBlack),
      ),
    );
  }
}

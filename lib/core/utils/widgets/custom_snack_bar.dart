import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: ColorsManager.kPrimaryBlue,
      duration: const Duration(seconds: 2),
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: const TextStyle(
          color: ColorsManager.kWhite,
          fontSize: 16,
        ),
      ),
    );
  }
}

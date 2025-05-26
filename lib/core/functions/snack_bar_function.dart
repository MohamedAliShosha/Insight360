import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: const TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorsManager.kPrimaryBlue,
      duration: const Duration(seconds: 2),
    ),
  );
}

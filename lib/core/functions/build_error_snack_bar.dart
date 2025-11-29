import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    duration: const Duration(
      seconds: 3,
    ),
    backgroundColor: ColorsManager.kPrimaryColor,
    content: Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: ColorsManager.kPrimaryBlue,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  );
}

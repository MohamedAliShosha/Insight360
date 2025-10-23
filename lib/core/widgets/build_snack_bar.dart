import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

SnackBar buildSnackBar({required String message}) {
  return SnackBar(
    duration: const Duration(milliseconds: 500),
    backgroundColor: ColorsManager.kPrimaryBlue,
    content: Center(
      child: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: ColorsManager.kWhiteColor,
        ),
      ),
    ),
  );
}

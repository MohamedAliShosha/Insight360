import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

SnackBar buildErrorSnackBar(String errorMessage) {
  return SnackBar(
    backgroundColor: ColorsManager.kPrimaryColor,
    content: Text(
      errorMessage,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

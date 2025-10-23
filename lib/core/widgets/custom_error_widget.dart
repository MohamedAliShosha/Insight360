import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        errorMessage,
        style: const TextStyle(
          color: ColorsManager.kWhiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w600, // SemiBold
        ),
      ),
    );
  }
}

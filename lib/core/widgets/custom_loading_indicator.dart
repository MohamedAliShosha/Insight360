import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorsManager.kPrimaryBlue,
      ),
    );
  }
}

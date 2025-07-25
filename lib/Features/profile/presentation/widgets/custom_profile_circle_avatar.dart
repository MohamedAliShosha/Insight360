import 'package:flutter/material.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class CustomProfileCircleAvatar extends StatelessWidget {
  const CustomProfileCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundColor: ColorsManager.kWhite,
        radius: 50,
        child: Icon(
          Icons.person,
          size: 100,
          color: ColorsManager.kPrimaryBlue,
        ),
      ),
    );
  }
}

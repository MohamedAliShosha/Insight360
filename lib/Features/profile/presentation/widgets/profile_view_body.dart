import 'package:flutter/material.dart';
import 'package:news_app/Features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:news_app/Features/profile/presentation/widgets/custom_user_info_container.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsManager.kPrimaryBlue,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600, // semibold
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsManager.kWhite,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: ColorsManager.kPrimaryBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomProfileCircleAvatar(),
          const SizedBox(height: 50),
          const CustomUserInfoContainer(
            rightPadding: 32,
            leftPadding: 32,
            text: 'User Name',
          ),
          const SizedBox(height: 50),
          const CustomUserInfoContainer(
            rightPadding: 32,
            leftPadding: 32,
            text: 'Email',
          ),
          const SizedBox(height: 50),
          const CustomUserInfoContainer(
            rightPadding: 32,
            leftPadding: 32,
            text: 'Phone Number',
          ),
          const SizedBox(height: 200),
          GestureDetector(
            onTap: () {
              // Add your logout logic here
            },
            child: const CustomUserInfoContainer(
              rightPadding: 100,
              leftPadding: 100,
              text: 'Logout',
            ),
          ),
        ],
      ),
    );
  }
}

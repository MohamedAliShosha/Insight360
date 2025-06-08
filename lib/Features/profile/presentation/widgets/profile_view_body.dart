import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/profile/presentation/widgets/custom_profile_circle_avatar.dart';
import 'package:news_app/Features/profile/presentation/widgets/custom_user_info_container.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_state.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_keys.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء البيانات عند بناء الصفحة
    context.read<LocalStorageCubit>().getUserData();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsManager.kPrimaryBlue,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsManager.kWhite),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: ColorsManager.kPrimaryBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomProfileCircleAvatar(),
          const SizedBox(height: 50),
          BlocBuilder<LocalStorageCubit, LocalStorageState>(
            builder: (context, state) {
              if (state is LocalStorageLoading) {
                return const CircularProgressIndicator(color: Colors.white);
              } else if (state is LocalStorageSuccess) {
                final name =
                    state.userData?[LocalStorageKeys.userName] ?? 'No Name';
                final email =
                    state.userData?[LocalStorageKeys.userEmail] ?? 'No Email';

                return Column(
                  children: [
                    CustomUserInfoContainer(
                      rightPadding: 32,
                      leftPadding: 32,
                      text: name,
                    ),
                    const SizedBox(height: 50),
                    CustomUserInfoContainer(
                      rightPadding: 32,
                      leftPadding: 32,
                      text: email,
                    ),
                  ],
                );
              } else if (state is LocalStorageError) {
                return Text(state.errorMessage,
                    style: const TextStyle(color: Colors.red));
              } else {
                return const Text('No data available',
                    style: TextStyle(color: Colors.white));
              }
            },
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
              // logout logic
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

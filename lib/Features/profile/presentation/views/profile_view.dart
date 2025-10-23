import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/profile/presentation/widgets/error_dialog.dart';
import 'package:news_app/Features/profile/presentation/widgets/user_info_row.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/shared_pref_helper.dart';
import 'package:news_app/core/utils/shared_pref_keys.dart';

import '../widgets/custom_profile_circle_avatar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? userName;
  String? userEmail;
  bool _isLoggingOut = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final name =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userName);
    final email =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userEmail);
    setState(() {
      userName = name;
      userEmail = email;
    });
  }

  Future<void> _handleLogout() async {
    final bool shouldLogout = await showErrorDialog(context) ?? false;

    if (!shouldLogout) return;

    setState(() => _isLoggingOut = true);

    try {
      await SharedPrefHelper.clearAllData();
      if (mounted) GoRouter.of(context).go(AppRouter.kLoginView);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logout failed. Please try again.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoggingOut = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: ColorsManager.kPrimaryBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const CustomProfileCircleAvatar(),
              const SizedBox(height: 20),
              Text(
                userName ?? 'No Name Available',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                userEmail ?? 'No Email Available',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: ColorsManager.kGreyColor,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ColorsManager.kWhiteColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildInfoRow(Icons.person_outline, "Username",
                        userName ?? "No Name"),
                    const Divider(height: 25, thickness: 0.8),
                    buildInfoRow(
                        Icons.email_outlined, "Email", userEmail ?? "No Email"),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: _isLoggingOut ? null : _handleLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.kWhiteColor,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                ),
                icon: _isLoggingOut
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: ColorsManager.kPrimaryBlue,
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.logout,
                        color: ColorsManager.kPrimaryBlue),
                label: Text(
                  _isLoggingOut ? 'Logging out...' : 'Logout',
                  style: const TextStyle(
                    color: ColorsManager.kPrimaryBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

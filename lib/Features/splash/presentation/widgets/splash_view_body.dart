import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_state.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_keys.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus(); //The first thing to do is calling the function to check user status
  }

  Future<void> _checkUserStatus() async {
    await BlocProvider.of<LocalStorageCubit>(context).getUserData();
    final state = BlocProvider.of<LocalStorageCubit>(context).state;

    if (state is LocalStorageSuccess &&
        state.userData?[LocalStorageKeys.userEmail] != null) {
      // المستخدم موجود، انتقل للصفحة الرئيسية
      Future.delayed(const Duration(seconds: 1), () {
        GoRouter.of(context).go(AppRouter.kHomeView);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalStorageCubit, LocalStorageState>(
      builder: (context, state) {
        if (state is LocalStorageLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Assets/Images/logo 1 (1).png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'INSIGHT ',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      TextSpan(
                        text: '360°',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.kWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            // فقط إذا لم يكن المستخدم موجود، أظهر زر Get Started
            if (state is LocalStorageSuccess &&
                state.userData?[LocalStorageKeys.userEmail] == null)
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignInView);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.kWhite,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

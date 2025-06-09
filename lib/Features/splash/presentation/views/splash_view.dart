import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/Features/splash/presentation/widgets/splash_view_body.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_service.dart';

import 'package:news_app/core/utils/colors_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.kPrimaryBlue,
      body: BlocProvider(
        create: (context) => LocalStorageCubit(
          LocalStorageService(),
        ),
        child: const SplashViewBody(),
      ),
    );
  }
}

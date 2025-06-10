import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignUpCubit/sign_up_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/sign_up_view_body.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_service.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.kWhite,
      body: MultiBlocProvider(
        providers: [
          BlocProvider<SignUpCubit>(
            create: (context) => SignUpCubit(),
          ),
          BlocProvider<LocalStorageCubit>(
            create: (context) => LocalStorageCubit(
              LocalStorageService(),
            ),
          ),
        ],
        child: const SignUpViewBody(),
      ),
    );
  }
}

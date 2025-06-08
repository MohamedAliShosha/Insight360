import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignInCubit/sign_in_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/sign_in_view_body.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/local%20storage/local_storage_services/local_storage_service.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInCubit(),
          ),
          BlocProvider(
            create: (context) => LocalStorageCubit(
              LocalStorageService(),
            ),
          ),
        ],
        child: const SignInViewBody(),
      ),
    );
  }
}

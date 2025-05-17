import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignInCubit/sign_in_cubit_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignInCubit(),
        child: const SignInViewBody(),
      ),
    );
  }
}

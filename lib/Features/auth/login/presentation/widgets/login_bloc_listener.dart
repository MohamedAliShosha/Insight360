import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../../../../../core/functions/snack_bar_function.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/colors_manager.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is LoginFailure) {
          showCustomSnackBar(
            context: context,
            message: state.loginApiErrorModel.message,
            backgroundColor: ColorsManager.kPrimaryColor,
            duration: const Duration(seconds: 3),
            textColor: ColorsManager.kPrimaryBlue,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            isCentered: true,
          );
        } else if (state is LoginSuccess) {
          // go => Navigates to the new screen and remove the current screen from the stack better with go_router than pushReplacement as it keeps the state of the current screen if I exist the app and return back the last opened screen will be displayed
          GoRouter.of(context).go(AppRouter.kHomeView);
        }
      },
    );
  }
}

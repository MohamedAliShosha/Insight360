import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login_request_body.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../../../../../core/widgets/app_button.dart';
import 'login_bloc_listener.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/widgets/form_fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey(); // To manage the form state
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          EmailFormField(
            controller: emailController,
            hintText: 'Enter your Email',
            labelText: 'Email',
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordFormField(
            controller: passwordController,
            hintText: 'Enter your password',
            labelText: 'Password',
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return AppButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                          LoginRequestBody(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                textColor: ColorsManager.kPrimaryBlue,
                containerColor: ColorsManager.kWhiteColor,
                leftPadding: 70,
                rightPadding: 70,
                buttonTitle: 'Sign In',
              );
            },
          ),
          const LoginBlocListener(),
        ],
      ),
    );
  }
}

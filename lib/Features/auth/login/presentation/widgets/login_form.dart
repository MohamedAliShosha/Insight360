import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/login/data/models/login_request_body.dart';
import 'package:news_app/Features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:news_app/core/widgets/app_button.dart';
import 'package:news_app/core/widgets/app_text_form_field.dart';
import 'package:news_app/Features/auth/login/presentation/widgets/login_bloc_listener.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/widgets/password_text_field.dart';

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
          AppTextFormField(
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            labelText: 'Email',
            hintText: 'Enter your Email',
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordTextField(
            passwordController: passwordController,
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

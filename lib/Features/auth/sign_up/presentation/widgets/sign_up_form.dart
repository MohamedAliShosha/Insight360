import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:news_app/Features/auth/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:news_app/Features/auth/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/widgets/app_text_form_field.dart';
import 'package:news_app/core/widgets/app_button.dart';
import 'package:news_app/core/widgets/password_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
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
            keyboardType: TextInputType.name,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (data.length < 3) {
                return 'Name must be at least 3 characters';
              }
              return null;
            },
            controller: nameController,
            labelText: 'Name',
            hintText: 'Enter your name',
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              if (!EmailValidator.validate(data)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            controller: emailController,
            labelText: 'Email',
            hintText: 'Enter your Email',
          ),
          const SizedBox(height: 16),
          AppTextFormField(
            keyboardType: TextInputType.phone,
            validator: (data) {
              if (data == null || data.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            controller: phoneController,
            labelText: 'Phone Number',
            hintText: 'Enter your phone number',
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            passwordController: passwordController,
            hintText: 'Enter your Password',
            labelText: 'Password',
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordTextField(
            passwordController: passwordConfirmationController,
            hintText: 'Confirm your password',
            labelText: 'Password Confirmation',
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return AppButton(
                isLoading: state is SignUpLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignUpCubit>().signUp(
                          SignUpRequestBody(
                            gender: 0,
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            phone: phoneController.text.trim(),
                            password: passwordController.text.trim(),
                            confirmPassword:
                                passwordConfirmationController.text.trim(),
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
                buttonTitle: 'Sign Up',
              );
            },
          ),
          const SignUpBlocListener(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/sign_up_request_body.dart';
import '../manager/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_bloc_listener.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/form_fields.dart';

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
          NameFormField(
            controller: nameController,
            hintText: 'Enter your name',
            labelText: 'Name',
          ),
          const SizedBox(height: 16),
          EmailFormField(
            controller: emailController,
            hintText: 'Enter your Email',
            labelText: 'Email',
          ),
          const SizedBox(height: 16),
          PhoneFormField(
            controller: phoneController,
            hintText: 'Enter your phone number',
            labelText: 'Phone Number',
          ),
          const SizedBox(height: 16),
          PasswordFormField(
            controller: passwordController,
            hintText: 'Enter your Password',
            labelText: 'Password',
          ),
          const SizedBox(
            height: 16,
          ),
          PasswordFormField(
            controller: passwordConfirmationController,
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

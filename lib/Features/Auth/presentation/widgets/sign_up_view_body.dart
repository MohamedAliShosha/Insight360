import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignUpCubit/sign_up_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/functions/snack_bar_function.dart';
import 'package:news_app/core/widgets/custom_logo_with_title.dart';
import 'package:news_app/core/widgets/custom_redirect_row.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String? userName, email, password, phoneNumber;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  void clearFields() {
    _emailController.clear();
    _passwordController.clear();
    _phoneNumberController.clear();
    _userNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showSnackBar(context, message: 'Sign up successfully!');
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignUpError) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: ColorsManager.kPrimaryBlue,
          ),
          color: ColorsManager.kPrimaryBlue,
          inAsyncCall: state is SignUpLoading,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: Form(
              key: formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomLogoWithTitle(),
                      CustomTextFormField(
                        controller: _userNameController,
                        onSaved: (newValue) {
                          userName = newValue;
                        },
                        onChanged: (data) {
                          userName = data;
                        },
                        hintText: 'Username',
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _emailController,
                        onSaved: (newValue) {
                          email = newValue;
                        },
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        onChanged: (data) {
                          password = data;
                        },
                        isObscure: true,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomButtonWithoutImage(
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              email != null &&
                              password != null) {
                            BlocProvider.of<SignUpCubit>(context)
                                .signUpMethod(email!, password!)
                                .then(
                              (_) {
                                BlocProvider.of<LocalStorageCubit>(context)
                                    .saveUserData(
                                  userName: userName!,
                                  email: email!,
                                );
                                clearFields();
                              },
                            );
                          } else {
                            showSnackBar(context,
                                message: 'Please fill all fields.');
                          }
                        },
                        textColor: ColorsManager.kWhite,
                        containerColor: ColorsManager.kPrimaryBlue,
                        leftPadding: 70,
                        rightPadding: 70,
                        text: 'Sign Up',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomRedirectRow(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kSignInView);
                        },
                        redirectTitle: 'Already have an account? ',
                        signUpOrSignIn: 'Sign In',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

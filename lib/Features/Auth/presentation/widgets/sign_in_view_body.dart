import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignInCubit/sign_in_cubit_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_divider.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_form%20_field.dart';

import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/functions/snack_bar_function.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  String? userName, email, password;
  GlobalKey<FormState> formKey = GlobalKey(); // To manage the form state
  bool isLoading = false; // To manage the loading state

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInCubitState>(
      listener: (context, state) {
        setState(() {
          isLoading = state is SignInLoading;
        });

        if (state is SignInSuccess) {
          ShowSnackBar(context, message: 'Sign in successfully!');
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignInError) {
          ShowSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall:
              isLoading, // Set to true when you want to show the loading indicator
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: Form(
              key: formKey, // Assign the formKey to the Form widget
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap:
                    true, // To make the ListView take only the space it needs
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Assets/Images/logo 1 (1).png',
                            width: 120,
                            height: 120,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 0),
                          const CustomRichText(),
                        ],
                      ),
                      CustomTextFormField(
                        onChanged: (value) {
                          userName = value;
                        },
                        hintText: 'Username',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        isObscure: true,
                        // suffixIcon: Icon(Icons.visibility_off),
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text('Forget Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorsManager.kBlack,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomButtonWithoutImage(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignInCubit>(context)
                                .signInMethod(email!, password!);
                          } else {
                            ShowSnackBar(context,
                                message: 'Please fill in all required fields.');
                          }
                        },
                        textColor: ColorsManager.kWhite,
                        containerColor: ColorsManager.kPrimaryBlue,
                        leftPadding: 70,
                        rightPadding: 70,
                        text: 'Sign In',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const CustomDivider(
                        signUpOrSignIn: 'or sign in with',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            textAlign: TextAlign.center,
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsManager.kLightGrey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            // I need to manage the navigation using Routing
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kSignUpView);
                            },
                            child: const Text(
                              textAlign: TextAlign.center,
                              'Register',
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorsManager.kBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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

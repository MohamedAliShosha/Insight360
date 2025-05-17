import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignUpCubit/sign_up_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/functions/snack_bar_function.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? userName, email, password, phoneNumber;
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ShowSnackBar(context, message: 'Sign up successfully!');
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignUpError) {
          ShowSnackBar(context, message: state.errorMessage);
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        onChanged: (data) {
                          userName = data;
                        },
                        hintText: 'Username',
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        onChanged: (data) {
                          phoneNumber = data;
                        },
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        hintText: 'Phone Number',
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        onChanged: (data) {
                          password = data;
                        },
                        isObscure: true,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              email != null &&
                              password != null) {
                            BlocProvider.of<SignUpCubit>(context)
                                .signUpMethod(email!, password!);
                          } else {
                            ShowSnackBar(context,
                                message: 'Please fill all fields');
                          }
                        },
                        child: const CustomButtonWithoutImage(
                          textColor: ColorsManager.kWhite,
                          containerColor: ColorsManager.kPrimaryBlue,
                          leftPadding: 70,
                          rightPadding: 70,
                          text: 'Sign Up',
                        ),
                      ),
                      const SizedBox(height: 16),
                      // const CustomDivider(signUpOrSignIn: 'or sign up with'),
                      // const SizedBox(height: 16),
                      const Text(
                        textAlign: TextAlign.center,
                        'By Signing up to Insight 360, you are accepting our Terms & Conditions',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorsManager.kBlack,
                          fontWeight: FontWeight.w500,
                        ),
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

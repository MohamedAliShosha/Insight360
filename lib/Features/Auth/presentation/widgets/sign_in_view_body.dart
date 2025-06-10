import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Features/Auth/presentation/manager/AuthCubits/SignInCubit/sign_in_cubit.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_form_field.dart';
import 'package:news_app/core/local%20storage/local_storage_cubit/local_storage_cubit.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/functions/snack_bar_function.dart';
import 'package:news_app/core/utils/styles.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  String? userName, email, password, phoneNumber;
  GlobalKey<FormState> formKey = GlobalKey(); // To manage the form state
  bool isLoading = false; // To manage the loading state

  @override
  // dispose role is to free the memory of the controller when the widget is disposed
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
    return BlocConsumer<SignInCubit, SignInCubitState>(
      listener: (context, state) {
        setState(() {
          isLoading = state is SignInLoading;
        });

        if (state is SignInSuccess) {
          showSnackBar(context, message: 'Sign in successfully!');
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignInError) {
          showSnackBar(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: ColorsManager.kPrimaryBlue,
          ),
          color: ColorsManager.kPrimaryBlue,
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
                        controller: _userNameController,
                        onSaved: (newValue) {
                          userName = newValue;
                        },
                        onChanged: (value) {
                          userName = value;
                        },
                        hintText: 'Username',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        onSaved: (newValue) {
                          email = newValue;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        controller: _passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                        isObscure: true,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Forget Password?',
                        style: Styles.txtStyleBold14.copyWith(
                          color: ColorsManager.kBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CustomButtonWithoutImage(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save(); // Save the form data

                            BlocProvider.of<SignInCubit>(context)
                                .signInMethod(email!, password!)
                                .then(
                              (_) {
                                BlocProvider.of<LocalStorageCubit>(context)
                                    .saveUserData(
                                  userName: userName!,
                                  email: email!,
                                );
                                clearFields(); // Clear the form fields
                              },
                            );
                          } else {
                            showSnackBar(context,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              'Don\'t have an account? ',
                              style: Styles.txtStyleMedium14.copyWith(
                                color: ColorsManager.kLightGrey,
                              )),
                          GestureDetector(
                            // I need to manage the navigation using Routing
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.kSignUpView);
                            },
                            child: Text(
                              textAlign: TextAlign.center,
                              'Register',
                              style: Styles.txtStyleMedium14
                                  .copyWith(color: ColorsManager.kBlack),
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

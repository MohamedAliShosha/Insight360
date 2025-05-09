import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_button_without_image.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_divider.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_rich_text.dart';
import 'package:news_app/Features/Auth/presentation/widgets/custom_text_field.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/functions/snack_bar_function.dart';

class SignUpViewBody extends StatefulWidget {
  // Changed to StatefulWidget
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  // Use a string to track the selected option
  String? userName, email, password;
  GlobalKey<FormState> formKey = GlobalKey(); // To manage the form state
  bool isLoading = false; // To manage the loading state

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
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
                    onChanged: (data) {
                      userName = data;
                    },
                    hintText: 'Username',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomTextFormField(
                    hintText: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      password = data;
                    },
                    isObscure: true,
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() => isLoading = true);
                        try {
                          await signUpMethod(
                            email!,
                            password!,
                          ); // ✅ يتم استدعاؤها فقط بعد التأكد أن الـ form صحيح
                          ShowSnackBar(context, message: 'Sign in successful!');
                          GoRouter.of(context).push(AppRouter.kHomeView);
                          // يمكنك توجيه المستخدم إلى الشاشة التالية هنا
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ShowSnackBar(context,
                                message: 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            ShowSnackBar(context,
                                message: 'Wrong password provided.');
                          } else {
                            ShowSnackBar(context,
                                message: 'An error occurred. Try again later.');
                          }
                        } finally {
                          setState(() => isLoading =
                              false); // ✅ لضمان إيقاف الـ loading سواء نجح أو فشل
                        }
                      } else {
                        ShowSnackBar(context,
                            message: 'Please fill in all required fields.');
                      }
                      ;
                      GoRouter.of(context).push(AppRouter.kHomeView);
                    },
                    child: const CustomButtonWithoutImage(
                      textColor: ColorsManager.kWhite,
                      containerColor: ColorsManager.kPrimaryBlue,
                      leftPadding: 70,
                      rightPadding: 70,
                      text: 'Sign Up',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomDivider(
                    signUpOrSignIn: 'or sign up with',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // const CustomButtonWithOutImage(
                  //   imagePath: 'Assets/Images/google.png',
                  //   leftPadding: 10,
                  //   rightPadding: 10,
                  //   textColor: ColorsManager.kWhite,
                  //   text: 'Continue with Google',
                  //   containerColor: ColorsManager.kPrimaryBlue,
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // const CustomButtonWithOutImage(
                  //   imagePath: 'Assets/Images/facebook.png',
                  //   leftPadding: 10,
                  //   rightPadding: 10,
                  //   textColor: ColorsManager.kWhite,
                  //   text: 'Continue with Facebook',
                  //   containerColor: ColorsManager.kPrimaryBlue,
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
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
  }

  Future<void> signUpMethod(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print("Signed up: ${userCredential.user!.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Unexpected error: $e');
    }
  }
}

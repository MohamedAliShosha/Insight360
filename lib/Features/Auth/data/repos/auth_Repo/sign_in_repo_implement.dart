import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Features/Auth/data/repos/auth_Repo/sign_in_repo.dart';
import 'package:news_app/core/utils/widgets/custom_snack_bar.dart';

class SignInRepoImplement implements SignInRepo {
  final FirebaseAuth firebaseAuth; // FirebaseAuth instance

  SignInRepoImplement({required this.firebaseAuth});
  @override
  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required context}) async {
    try {
      final UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      CustomSnackBar(message: 'User signed in: ${userCredential.user?.uid}');
      print('User signed in: ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        const CustomSnackBar(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        const CustomSnackBar(message: 'Wrong password provided for that user.');
      } else {
        print('Error signing in with email: $e');
        CustomSnackBar(message: 'Error signing in with email: ${e.toString()}');
      }
    }
  }

  // @override
  // Future<void> signInWithFacebook() {
  //   return firebaseAuth
  //       .signInWithCredential(FacebookAuthProvider.credential('accessToken'))
  //       .then((value) {
  //     print('User signed in with Facebook: ${value.user?.uid}');
  //   }).catchError((error) {
  //     print('Error signing in with Facebook: $error');
  //   });
  // }

  // @override
  // Future<void> signInWithGoogle() {
  //   return firebaseAuth
  //       .signInWithCredential(GoogleAuthProvider.credential())
  //       .then((value) {
  //     print('User signed in with Google: ${value.user?.uid}');
  //   }).catchError((error) {
  //     print('Error signing in with Google: $error');
  //   });
  // }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      print('User signed out');
    } catch (error) {
      print('Error signing out: $error');
      rethrow;
    }
  }
}

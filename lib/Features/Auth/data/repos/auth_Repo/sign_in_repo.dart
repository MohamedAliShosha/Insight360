import 'package:flutter/material.dart';

abstract class SignInRepo {
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  });

  // Future<void> signInWithGoogle();
  // Future<void> signInWithFacebook();

  Future<void> signOut();
}

import 'package:flutter/material.dart';
import '../utils/shared_pref_helper.dart';
import '../utils/shared_pref_keys.dart';

/// Method that saves user email
Future<void> saveUserEmail(String? userEmail) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userEmail, userEmail!); // save userEmail

  debugPrint('User email saved: $userEmail');
}

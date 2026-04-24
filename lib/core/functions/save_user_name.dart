import 'package:flutter/material.dart';
import '../utils/shared_pref_helper.dart';
import '../utils/shared_pref_keys.dart';

/// Method that saves user name
Future<void> saveUserName(String? userName) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userName, userName!); // save userName

  debugPrint('User name saved: $userName');
}

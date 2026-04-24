import 'package:flutter/material.dart';
import '../utils/shared_pref_helper.dart';
import '../utils/shared_pref_keys.dart';

/// Method that saves user access token
Future<void> saveUserAccessToken(String? accessToken) async {
  // Assuming you have a method to save the token in shared preferences
  await SharedPrefHelper.setSecuredString(
      SharedPrefKeys.userToken, accessToken!); // save userToken

  debugPrint('User access token saved: $accessToken');
}

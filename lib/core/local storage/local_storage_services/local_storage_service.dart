import 'package:news_app/core/local%20storage/local_storage_services/local_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveUserData(
      String userName, String email, String phoneNumber) async {
    final prefs = await SharedPreferences
        .getInstance(); // get instance of shared preferences
    await prefs.setString(
        LocalStorageKeys.userName, userName); // save user name
    await prefs.setString(LocalStorageKeys.userEmail, email); // save user email

    await prefs.setString(
        LocalStorageKeys.phoneNumber, phoneNumber); // save user email
  }

  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences
        .getInstance(); // get instance of shared preferences
    return {
      LocalStorageKeys.userName:
          prefs.getString(LocalStorageKeys.userName), // get user name
      LocalStorageKeys.userEmail:
          prefs.getString(LocalStorageKeys.userEmail), // get user email
    };
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(LocalStorageKeys.userName);
    await prefs.remove(LocalStorageKeys.userEmail);
  }
}

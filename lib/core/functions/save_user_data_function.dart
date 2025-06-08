import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserDataLocally({
  required String userName,
  required String email,
}) async {
  final prefs =
      await SharedPreferences.getInstance(); // get shared preferences instance.
  await prefs.setString('user_name', userName); // save user name
  await prefs.setString('user_email', email); // save user email
}

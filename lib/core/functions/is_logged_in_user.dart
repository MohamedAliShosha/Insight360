import '../utils/shared_pref_helper.dart';
import '../utils/shared_pref_keys.dart';

Future<void> checkIfUserIsLoggedIn() async {
  final userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

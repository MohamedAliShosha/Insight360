import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_pref_helper.dart';
import 'core/utils/shared_pref_keys.dart';
import 'core/utils/simple_bloc_observer.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _checkIfUserIsLoggedIn();
    Bloc.observer = SimpleBlocObserver();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    setUpServiceLocator();
    await SharedPreferences.getInstance();
  }

  static Future<void> _checkIfUserIsLoggedIn() async {
    final userToken =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    if (userToken != null && userToken.isNotEmpty) {
      isLoggedInUser = true;
    } else {
      isLoggedInUser = false;
    }
  }
}

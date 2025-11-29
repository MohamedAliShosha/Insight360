import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/core/utils/shared_pref_helper.dart';
import 'package:news_app/core/utils/shared_pref_keys.dart';
import 'package:news_app/core/utils/simple_bloc_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO => Add user check method
Future<void> checkIfUserIsLoggedIn() async {
  // Getting userToken and storing it in a variable
  final userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  // Check if the userToken is not null and not empty

  if (userToken != null && userToken.isNotEmpty) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return HeroControllerScope.none(child: child!);
      },
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.kWhiteColor,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, //
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkIfUserIsLoggedIn();
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const NewsApp());
}

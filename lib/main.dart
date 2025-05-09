import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/app_router.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return HeroControllerScope.none(child: child!);
      },
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, //
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
      // androidProvider: AndroidProvider.playIntegrity, // this for production mode
      androidProvider: AndroidProvider.debug); // this for development modereff
  // await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true)

  // Initialize any necessary services or plugins here

  runApp(const NewsApp());
}

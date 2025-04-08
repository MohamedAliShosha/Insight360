import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Auth/presentation/views/sign_in_view.dart';
import 'package:news_app/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:news_app/Features/splash/presentation/views/splash_view.dart';

// abstract class is used to create a base class that cannot be instantiated directly
abstract class AppRouter {
  static const kSignInView =
      '/signInView'; // This is the path that will be used to navigate to the sign in screen
  static const kSignUpView =
      '/signUpView'; // This is the path that will be used to navigate to the sign up screen
  // static used to make the method accessible without creating an instance of the class
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/', // This is the starting screen path of the app
        builder: (context, state) => const SplashView(), // The started screen
      ),
      GoRoute(
        path:
            kSignInView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path:
            kSignUpView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}

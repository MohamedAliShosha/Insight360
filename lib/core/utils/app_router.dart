import 'package:go_router/go_router.dart';
import 'package:news_app/Features/Auth/presentation/views/sign_in_view.dart';
import 'package:news_app/Features/Auth/presentation/views/sign_up_view.dart';
import 'package:news_app/Features/Home/presentation/views/home_view.dart';
import 'package:news_app/Features/NewsDetails/presentation/views/news_details_view.dart';
import 'package:news_app/Features/Search/presentation/views/search_view.dart';
import 'package:news_app/Features/profile/presentation/views/profile_view.dart';

import 'package:news_app/Features/splash/presentation/views/splash_view.dart';

// abstract class is used to create a base class that cannot be instantiated directly
abstract class AppRouter {
  // static means that the variable belongs to the class itself rather than an instance of the class
  static const kSignInView =
      '/signInView'; // This is the path that will be used to navigate to the sign in screen
  static const kSignUpView = '/signUpView';
  static const kHomeView = '/homeView';
  static const kNewsDetailsView = '/newsDetailsView';
  static const kSearchView = '/searchView';
  static const kProfileView =
      '/profileView'; // This is the path that will be used to navigate to the profile screen

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
      GoRoute(
        path:
            kHomeView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path:
            kNewsDetailsView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const NewsDetailsView(),
      ),
      GoRoute(
        path:
            kSearchView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path:
            kProfileView, // The path that will be used to navigate to the home screen
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}

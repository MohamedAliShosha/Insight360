import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/Features/auth/login/data/repos/login_repo_implement.dart';
import 'package:news_app/Features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:news_app/Features/auth/login/presentation/views/login_view.dart';
import 'package:news_app/Features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:news_app/Features/auth/sign_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:news_app/Features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Home/presentation/views/home_view.dart';
import 'package:news_app/Features/NewsDetails/presentation/views/news_details_view.dart';
import 'package:news_app/Features/Search/data/repos/search_repo_implement.dart';
import 'package:news_app/Features/Search/presentation/manager/SearchCubit/search_cubit.dart';
import 'package:news_app/Features/Search/presentation/views/search_view.dart';
import 'package:news_app/Features/profile/presentation/views/profile_view.dart';
import 'package:news_app/Features/splash/presentation/views/splash_view.dart';
import 'package:news_app/core/utils/service_locator.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kHomeView = '/homeView';
  static const kNewsDetailsView = '/newsDetailsView';
  static const kSearchView = '/searchView';
  static const kProfileView = '/profileView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => NoTransitionPage(
          child: BlocProvider(
            create: (context) => LoginCubit(
              getIt<LoginRepoImplement>(),
            ),
            child: const LoginView(),
          ),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) => NoTransitionPage(
          child: BlocProvider(
            create: (context) => SignUpCubit(
              getIt<SignUpRepo>(),
            ),
            child: const SignUpView(),
          ),
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomeView(),
        ),
      ),
      GoRoute(
        path: kNewsDetailsView,
        pageBuilder: (context, state) => NoTransitionPage(
          child: NewsDetailsView(
            article: state.extra as Article,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        pageBuilder: (context, state) => NoTransitionPage(
          child: BlocProvider(
            create: (context) => SearchCubit(
              getIt<SearchRepoImplement>(),
            ),
            child: const SearchView(),
          ),
        ),
      ),
      GoRoute(
        path: kProfileView,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: ProfileView(),
        ),
      ),
    ],
  );
}

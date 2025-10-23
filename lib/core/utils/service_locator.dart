import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/Features/Home/data/repos/home_repo_implement.dart';
import 'package:news_app/Features/Search/data/repos/search_repo_implement.dart';
import 'package:news_app/Features/auth/login/data/repos/login_repo_implement.dart';
import 'package:news_app/Features/auth/login/services/login_service.dart';
import 'package:news_app/Features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:news_app/Features/auth/sign_up/data/repos/sign_up_repo_implement.dart';
import 'package:news_app/Features/auth/sign_up/services/sign_up_service.dart';
import 'package:news_app/core/utils/api_service.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setUpServiceLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<Dio>()),
  );

  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<LoginService>(
    LoginService(
      getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<SignUpService>(
    SignUpService(
      getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<SignUpRepo>(
    SignUpRepoImplement(
      getIt<SignUpService>(),
    ),
  );

  getIt.registerSingleton<LoginRepoImplement>(
    LoginRepoImplement(
      getIt<LoginService>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImplement>(
    SearchRepoImplement(
      getIt<ApiService>(),
    ),
  );
}

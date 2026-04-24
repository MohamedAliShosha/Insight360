import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/Home/data/repos/home_repo_implement.dart';
import '../../Features/Home/data/services/home_service.dart';
import '../../Features/Home/data/services/news_service.dart';
import '../../Features/Search/data/repos/search_repo_implement.dart';
import '../../Features/auth/login/data/repos/login_repo_implement.dart';
import '../../Features/auth/login/services/login_service.dart';
import '../../Features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../Features/auth/sign_up/data/repos/sign_up_repo_implement.dart';
import '../../Features/auth/sign_up/services/sign_up_service.dart';
import 'constants.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setUpServiceLocator() {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<NewsService>(
    () => NewsService(getIt<Dio>(), baseUrl: Constants.newsBaseUrl),
  );
  getIt.registerLazySingleton<HomeService>(
    () => HomeService(getIt<Dio>(), baseUrl: Constants.newsBaseUrl),
  );

  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      getIt<HomeService>(),
    ),
  );
  getIt.registerSingleton<LoginService>(
    LoginService(
      getIt<Dio>(),
      baseUrl: Constants.registrationBaseUrl,
    ),
  );
  getIt.registerSingleton<SignUpService>(
    SignUpService(
      getIt<Dio>(),
      baseUrl: Constants.registrationBaseUrl,
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
      getIt<NewsService>(),
    ),
  );
}

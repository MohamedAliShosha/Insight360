import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/Features/Home/data/repos/home_repo_implement.dart';
import 'package:news_app/core/utils/api_service.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setUpServiceLocator() {
  getIt.registerSingleton<HomeRepoImplement>(
    HomeRepoImplement(
      ApiService(
        Dio(),
      ),
    ),
  );
}

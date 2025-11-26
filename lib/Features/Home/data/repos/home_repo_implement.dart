import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Home/data/repos/home_repo.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/utils/api_service.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failures, List<Article>>> getToHeadLines({
    int pageNumber =
        1, // 2 => Setting a default value for the first page because this is the implementation of the homeRepo
    required String apiKey,
    required String country,
    required String category,
  }) async {
    try {
      final data = await apiService.get(
        endPoint:
            'top-headlines?category=$category&country=$country&apiKey=$apiKey&page=$pageNumber',
      );

      final articles = data['articles'] as List;
      final articlesList =
          articles.map((item) => Article.fromJson(item)).toList();

      return Right(articlesList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

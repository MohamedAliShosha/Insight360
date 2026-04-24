import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../models/news_model/article.dart';
import 'home_repo.dart';
import '../../../../core/errors/failures.dart';
import '../services/home_service.dart';

class HomeRepoImplement implements HomeRepo {
  final HomeService homeService;

  HomeRepoImplement(this.homeService);

  @override
  Future<Either<Failures, List<Article>>> getToHeadLines({
    int pageNumber =
        1, // 2 => Setting a default value for the first page because this is the implementation of the homeRepo
    required String apiKey,
    required String country,
    required String category,
  }) async {
    try {
      final newsResponse = await homeService.getTopHeadlines(
        category: category,
        country: country,
        apiKey: apiKey,
        page: pageNumber,
      );

      final articlesList = newsResponse.articles;

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

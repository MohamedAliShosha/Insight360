import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../Home/data/models/news_model/article.dart';
import '../../../Home/data/services/news_service.dart';
import 'search_repo.dart';
import '../../../../core/errors/failures.dart';

class SearchRepoImplement implements SearchRepo {
  final NewsService newsService;

  SearchRepoImplement(this.newsService);
  @override
  Future<Either<Failures, List<Article>>> getSearchedNews(
      {required String apiKey,
      required String country,
      required String category}) async {
    try {
      var response = await newsService.getTopHeadlines(
        category: category,
        country: country,
        apiKey: apiKey,
      );

      return right(response.articles);
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

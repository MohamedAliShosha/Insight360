import 'package:dartz/dartz.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/Features/Search/data/repos/search_repo.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/utils/api_service.dart';

class SearchRepoImplement implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplement(this.apiService);
  @override
  Future<Either<Failures, List<Article>>> getSearchedNews(
      {required String apiKey,
      required String country,
      required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'top-headlines?category=$category&country=$country&apiKey=$apiKey');

      final articles = data['articles'] as List;
      final articlesList =
          articles.map((item) => Article.fromJson(item)).toList();
      return right(articlesList);
    } catch (e) {
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

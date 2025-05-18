import 'package:dartz/dartz.dart';
import 'package:news_app/Features/Home/data/models/news_model/news_model.dart';
import 'package:news_app/Features/Home/data/repos/home_repo.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/utils/api_service.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplement(this.apiService);

  @override
  Future<Either<Failures, List<NewsModel>>> getToHeadLines({
    required String apiKey,
    required String country,
    required String category,
  }) async {
    try {
      final data = await apiService.get(
        endPoint:
            'top-headlines?category=$category&country=$country&apiKey=$apiKey',
      );

      final articles = data['articles'] as List;
      final news = articles.map((item) => NewsModel.fromJson(item)).toList();

      return Right(news);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

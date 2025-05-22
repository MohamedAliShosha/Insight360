import 'package:dartz/dartz.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<Article>>> getSearchedNews({
    required String apiKey,
    required String country,
    required String category,
  });
}

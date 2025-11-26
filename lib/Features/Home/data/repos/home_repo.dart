import 'package:dartz/dartz.dart';
import 'package:news_app/Features/Home/data/models/news_model/article.dart';
import 'package:news_app/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Article>>> getToHeadLines({
    required String apiKey,
    required String country,
    required String category,
    int pageNumber =
        0, // 1 => Setting a default value for the first page "Pagination"
  });
}

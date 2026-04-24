import 'package:dartz/dartz.dart';
import '../models/news_model/article.dart';
import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<Article>>> getToHeadLines({
    required String apiKey,
    required String country,
    required String category,
    int pageNumber =
        1, // 1 => Setting a default value for the first page "Pagination"
  });
}

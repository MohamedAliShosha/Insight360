import 'package:dartz/dartz.dart';
import '../../../Home/data/models/news_model/article.dart';
import '../../../../core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<Article>>> getSearchedNews({
    required String apiKey,
    required String country,
    required String category,
  });
}

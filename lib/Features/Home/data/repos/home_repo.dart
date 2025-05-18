import 'package:dartz/dartz.dart';
import 'package:news_app/Features/Home/data/models/news_model/news_model.dart';
import 'package:news_app/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<NewsModel>>> getToHeadLines({
    required String apiKey,
    required String country,
    required String category,
  });
}

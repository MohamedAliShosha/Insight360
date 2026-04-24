import 'package:news_app/Features/Home/data/models/news_model/news_response.dart';
import 'package:news_app/core/utils/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_service.g.dart';

@RestApi()
abstract class NewsService {
  factory NewsService(Dio dio, {String? baseUrl}) = _NewsService;

  @GET(ApiEndpoints.topHeadlines)
  Future<NewsResponse> getTopHeadlines({
    @Query('category') String? category,
    @Query('country') String? country,
    @Query('apiKey') String? apiKey,
    @Query('page') int? page,
  });
}

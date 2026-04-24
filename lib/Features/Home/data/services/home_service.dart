import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../../core/utils/api_endpoints.dart';
import '../models/news_model/news_response.dart';

part 'home_service.g.dart';

@RestApi()
abstract class HomeService {
  factory HomeService(Dio dio, {String? baseUrl}) = _HomeService;

  @GET(ApiEndpoints.topHeadlines)
  Future<NewsResponse> getTopHeadlines({
    @Query('category') String? category,
    @Query('country') String? country,
    @Query('apiKey') String? apiKey,
    @Query('page') int? page,
  });
}

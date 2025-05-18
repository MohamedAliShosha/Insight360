import 'package:dio/dio.dart';
import 'package:news_app/constants.dart';

class ApiService {
  final String _baseUrl = Constants.baseUrl;
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$_baseUrl$endPoint');
    return response.data as Map<String, dynamic>;
  }
}

import 'package:dio/dio.dart';

class ApiService // This class is a wrapper class for all the api services
{
  final _baseUrl = 'https://newsapi.org/v2/'; // Base url for the api

  final Dio _dio;
  ApiService(this._dio); // Constructor for the class

  Future<Map<String, dynamic>> get(
      {required String
          endPoint}) async // This function is used to make a get request to the api
  {
    await _dio.get('$_baseUrl$endPoint');

    var response = await _dio.get('$_baseUrl$endPoint');
    return response
        .data; // We don't need to parse the response as it is already in Map<String , dynamic> format
  }
}

class ApiEndpoints {
  // News API endpoints
  static const String topHeadlines = '/top-headlines';

  static String getTopHeadlinesWithParams({
    required String category,
    required String country,
    required String apiKey,
    required int page,
  }) {
    return '$topHeadlines?category=$category&country=$country&apiKey=$apiKey&page=$page';
  }

  // Auth API endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
}

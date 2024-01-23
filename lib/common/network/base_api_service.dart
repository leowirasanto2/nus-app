abstract class BaseApiService {
  final String baseUrl = "newsapi.org";
  final String apiKey =
      "283968034fbc4db691fd4115a1e2daec"; //regenerate this value from newsapi.org

  Future<dynamic> getAllNewsResponse(String url, String countryCode);
}
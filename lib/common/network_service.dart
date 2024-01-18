import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nusapp/models/decodable/news_response.dart';

abstract class BaseApiService {
  final String baseUrl = "newsapi.org";
  final String apiKey =
      "283968034fbc4db691fd4115a1e2daec"; //regenerate this value from newsapi.org

  Future<dynamic> getAllNewsResponse(String url, String countryCode);
}

// network_api_service.dart
class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getAllNewsResponse(String url, String countryCode) async {
    dynamic responseJson;
    try {
      var query = {"country": countryCode, "apiKey": apiKey};

      var uri = Uri.http(baseUrl, url, query);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return NewsResponse.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        Exception('Failed to decode');
      }
    } catch (e) {
      throw Exception('Failed to fetch news');
    }
  }
}

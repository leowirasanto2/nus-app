import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nusapp/common/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getAllNewsResponse(String url, String countryCode) async {
    dynamic responseJson;
    try {
      var query = {"apiKey": apiKey, "country": countryCode, "pageSize": "15"};
      var uri = Uri.http(baseUrl, url, query);
      final response = await http.get(uri);
      responseJson = jsonDecode(response.body);
    } catch (e) {
      throw Error();
    }
    return responseJson;
  }
}

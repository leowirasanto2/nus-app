import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nusapp/common/extensions/string_extension.dart';
import 'package:nusapp/common/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getAllNewsResponse(String url, String? countryCode, int pageSize) async {
    dynamic responseJson;
    try {
      var query = {"apiKey": apiKey, "pageSize": "$pageSize"};
      if (!countryCode.isEmptyOrNull) {
        query['country'] = countryCode.orEmpty;
      }
      var uri = Uri.http(baseUrl, url, query);
      final response = await http.get(uri);
      print('request (${uri.toString()}) -- \n${response.body}');
      responseJson = jsonDecode(response.body);
    } catch (e) {
      throw Error();
    }
    return responseJson;
  }

  @override
  Future searchAllNewsResponse(String url, String keyword, String? countryCode, int pageSize) async {
    dynamic responseJson;
    try {
      var query = {"apiKey": apiKey, "pageSize": "$pageSize", "q": keyword};
      if (!countryCode.isEmptyOrNull) {
        query['country'] = countryCode.orEmpty;
      }
      var uri = Uri.http(baseUrl, url, query);
      final response = await http.get(uri);
      print('request (${uri.toString()}) -- \n${response.body}');
      responseJson = jsonDecode(response.body);
    } catch (e) {
      throw Error();
    }
    return responseJson;
  }
}

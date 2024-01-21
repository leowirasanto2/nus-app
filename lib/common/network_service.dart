import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nusapp/common/base_api_service.dart';
import 'package:nusapp/models/decodable/news_response.dart';

// network_api_service.dart
class NetworkApiService extends BaseApiService {
  @override
  Future<dynamic> getAllNewsResponse(String url, String countryCode) async {
    dynamic responseJson;
    try {
      var query = {"apiKey": apiKey, "country": countryCode};
      var uri = Uri.http(baseUrl, url, query);
      print(uri);
      final response = await http.get(uri);
      // responseJson = returnResponse(response);
      responseJson = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
      // if (e is AppException) {
      //   throw FetchDataException(e.toString());
      // } else if (e is SocketException) {
      //   throw FetchDataException("Socket Exception: ${e.toString()}");
      // } else {
      //   throw FetchDataException("Something went wrong: ${e.toString()}");
      // }
    }
    return responseJson;
  }

  // dynamic returnResponse(http.Response response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body);
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(response.toString());
  //     case 401:
  //     case 403:
  //     case 404:
  //       dynamic responseJson = jsonDecode(response.body);
  //       throw UnauthorisedException(responseJson['message']);
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //           'Error occurred while communication with server with status code : ${response.statusCode}');
  //   }
  // }
}

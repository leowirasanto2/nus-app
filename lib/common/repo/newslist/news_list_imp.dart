import 'package:nusapp/common/network/api_endpoints.dart';
import 'package:nusapp/common/network/base_api_service.dart';
import 'package:nusapp/common/network/network_service.dart';
import 'package:nusapp/common/repo/newslist/news_list_repo.dart';

class NewsListRepoImp extends NewsListRepo {
  final BaseApiService _apiService = NetworkApiService();

  //. This method read data from server
  @override
  Future getNewsList(String? countryCode, int pageSize) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(
          ApiEndPoints().getNewsList, countryCode, pageSize);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future searchNews(String keyword, String? countryCode, int pageSize) async {
    try {
      dynamic response = await _apiService.searchAllNewsResponse(
          ApiEndPoints().getNewsList, keyword, countryCode, pageSize);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

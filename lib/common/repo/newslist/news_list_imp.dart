import 'package:nusapp/common/network/api_endpoints.dart';
import 'package:nusapp/common/network/base_api_service.dart';
import 'package:nusapp/common/network/network_service.dart';
import 'package:nusapp/common/repo/newslist/news_list_repo.dart';

class NewsListRepoImp extends NewsListRepo {
  final BaseApiService _apiService = NetworkApiService();
  static const int _pageSize = 10;

  //. This method read data from server
  @override
  Future getNewsList(String countryCode) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(ApiEndPoints().getNewsList, countryCode);
      return response;
    } catch(e) {
      rethrow;
    }
  }
}
import 'package:nusapp/blocs/repo/landing_repo.dart';
import 'package:nusapp/common/api_endpoints.dart';
import 'package:nusapp/common/base_api_service.dart';
import 'package:nusapp/common/network_service.dart';

class LandingRepoImp extends LandingRepo {
  final BaseApiService _apiService = NetworkApiService();
  static const int _pageSize = 10;

  //. This method read data from server
  @override
  Future getNewsData(String countryCode) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(ApiEndPoints().getNewsList, countryCode);
      return response;
    } catch(e) {
      rethrow;
    }
  }
}
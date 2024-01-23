import 'package:nusapp/common/network/api_endpoints.dart';
import 'package:nusapp/common/network/base_api_service.dart';
import 'package:nusapp/common/network/network_service.dart';
import 'package:nusapp/common/repo/landing/landing_repo.dart';

class LandingRepoImp extends LandingRepo {
  final BaseApiService _apiService = NetworkApiService();

  //. This method read data from server
  @override
  Future getNewsData(String countryCode, int pageSize) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(ApiEndPoints().getHeadlineNews, countryCode, pageSize);
      return response;
    } catch(e) {
      rethrow;
    }
  }
}
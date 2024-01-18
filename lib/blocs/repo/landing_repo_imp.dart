import 'package:nusapp/blocs/repo/landing_repo.dart';
import 'package:nusapp/common/APIEndPoints.dart';
import 'package:nusapp/common/network_service.dart';

class LandingRepoImp extends LandingRepo {
  final BaseApiService _apiService = NetworkApiService();

  //. This method read data from server
  @override
  Future<dynamic> getLandingArticles(String countryCode) async {
    try {
      dynamic response = await _apiService.getAllNewsResponse(ApiEndPoints().getNewsList, countryCode);
      return response;
    } catch(e) {
      rethrow;
    }
  }
}
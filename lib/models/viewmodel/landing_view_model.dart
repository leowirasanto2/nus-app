import 'news_model.dart';

class LandingViewModel {
  Article? headline;
  List<Article> otherArticles;

  LandingViewModel({this.headline, required this.otherArticles});
}
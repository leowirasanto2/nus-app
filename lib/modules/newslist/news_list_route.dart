import 'package:flutter/cupertino.dart';

abstract class NewsListRoute {
  final BuildContext context;

  NewsListRoute({required this.context});
}

class NewsListRouteImp extends NewsListRoute {
  NewsListRouteImp({required super.context});
}

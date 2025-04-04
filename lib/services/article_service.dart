import 'package:dio/dio.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/news_article.dart';
import 'package:real_estate_fe/services/http_service.dart';

class ArticleService extends HttpService {
  Future<void> fetchArticles() async {
    get(
      Api.news,
    );
  }

  @override
  fromResponse(Response response) {
    return (response.data["items"] as List)
        .map((e) => NewsArticle.fromJson(e))
        .toList();
  }

  @override
  parser(Map<String, dynamic> hiveMap) {
    return (hiveMap["data"]["items"] as List)
        .map((e) => NewsArticle.fromJson(e))
        .toList();
  }
}

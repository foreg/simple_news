import 'package:simple_news/api/nyt_api.dart';
import 'package:simple_news/models/news.dart';

class NewsRepository {
  String section;
  NytApi _nytApi = NytApi();

  Future<List<News>> getNews({int limit, int offset}) async =>
      _nytApi.fetchNews(limit: limit, offset: offset);
}

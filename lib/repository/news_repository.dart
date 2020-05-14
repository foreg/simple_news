import 'package:simple_news/api/nyt_api.dart';
import 'package:simple_news/models/news.dart';

class NewsRepository {
  NytApi _nytApi = NytApi();

  Future<List<News>> getNews({int limit, int offset, String source}) async =>
      _nytApi.fetchNews(limit: limit, offset: offset, source: source);
}

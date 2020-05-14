import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_news/api/key.dart';

import 'package:simple_news/models/news.dart';

class NytApi {
  final String _host = 'https://api.nytimes.com/svc/news/v3/content/';
  final String _apiKey = apiKey;

  Future<List<News>> fetchNewsMock(
      {int limit = 20, int offset = 0, String source = 'all'}) async {
    var news = List<News>();
    for (int i = offset * limit; i < offset * limit + limit; i++) {
      news.add(News('news$i', 'all', 'title $i', 'desc $i', 'http://google.com',
          'by author', 'http://via.placeholder.com/75x75', 'New York Times'));
    }
    return news;
  }

  Future<List<News>> fetchNews(
      {int limit = 20, int offset = 0, String source = 'all'}) async {
    final query =
        '${source ?? 'all'}/all.json?api-key=$_apiKey&limits=$limit&offset=$offset';
    final response = await http.get(_host + query);
    try {
      return (json.decode(response.body)['results'] as List)
          .map((item) => News.fromJson(item))
          .toList();
    } catch (_) {
      return [];
    }
  }
}

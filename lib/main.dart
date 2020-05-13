import 'package:flutter/material.dart';
import 'package:simple_news/pages/main_page.dart';
import 'package:simple_news/pages/news_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simple news',
      // home: MainPage(),
      routes: {
        '/': (context) => MainPage(),
        '/news_detail': (context) =>
            NewsDetailPage(news: ModalRoute.of(context).settings.arguments),
      },
    );
  }
}

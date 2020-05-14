import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:simple_news/models/news.dart';

class NewsDetailPage extends StatelessWidget {
  final News news;

  const NewsDetailPage({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News details'),
        ),
        body: WebView(
          initialUrl: news.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

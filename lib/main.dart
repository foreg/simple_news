import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_news/bloc/application_bloc.dart';
import 'package:simple_news/bloc/news_bloc.dart';
import 'package:simple_news/pages/main_page.dart';
import 'package:simple_news/pages/news_detail_page.dart';
import 'package:simple_news/pages/settings_page.dart';
import 'package:simple_news/repository/news_repository.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApplicationBloc()..add(LoadApplication()),
        ),
        BlocProvider(
          create: (context) => NewsBloc(newsRepository: NewsRepository()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple news',
      routes: {
        '/': (context) => MainPage(),
        '/news_detail': (context) =>
            NewsDetailPage(news: ModalRoute.of(context).settings.arguments),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

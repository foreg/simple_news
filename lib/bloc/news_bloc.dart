import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_news/models/news.dart';
import 'package:simple_news/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;

  NewsBloc({this.newsRepository});
  @override
  NewsState get initialState => NewsInitial();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    final currentState = state;
    if (event is Fetch) {
      try {
        if (currentState is NewsInitial) {
        final news = await newsRepository.getNews(limit: 20, offset: 0);
        yield NewsLoaded(news: news);
      }
      else if (currentState is NewsLoaded) {
        final news = await newsRepository.getNews(limit: 20, offset: currentState.news.length);
        news.removeWhere((element) => currentState.news.contains(element));
        yield NewsLoaded(news: currentState.news + news);
      }
      }
      catch (_) {
        yield NewsError();
      }
      
    }
  }
}

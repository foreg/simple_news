// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_news/bloc/news_bloc.dart';

import 'package:simple_news/models/news.dart';
import 'package:simple_news/repository/news_repository.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  group('NewsBloc', () {
    NewsRepository newsRepository;
    NewsBloc newsBloc;

    setUp(() {
      newsRepository = MockNewsRepository();
      newsBloc = NewsBloc(newsRepository: newsRepository);
    });

    tearDown(() {
      newsBloc.close();
    });

    test('initial state is NewsInitial', () {
      expect(newsBloc.initialState, NewsInitial());
    });

    blocTest(
      'emits 20 news when Fetch is added',
      build: () async {
        when(newsRepository.getNews(limit: 20, offset: 0, source: 'all')).thenAnswer((_) => Future.value(List<News>(20)));
        return newsBloc;
      },
      act: (bloc) async => bloc.add(Fetch(source: 'all')),
      expect: [NewsLoaded(news: List<News>(20))],
    );
  });
}

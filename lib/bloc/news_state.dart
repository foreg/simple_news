part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsError extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> news;

  NewsLoaded({this.news});

  @override
  List<Object> get props => [news];
}

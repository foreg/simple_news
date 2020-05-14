part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends NewsEvent {
  final String source;

  Fetch({this.source});

  @override
  List<Object> get props => [source];
}

class Clear extends NewsEvent {}
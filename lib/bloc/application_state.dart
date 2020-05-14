part of 'application_bloc.dart';

enum Source {
  all,
  nyt,
  inyt,
}
abstract class ApplicationState extends Equatable {
  const ApplicationState();
  
  @override
  List<Object> get props => [];
}

class ApplicationInitial extends ApplicationState {}

class ApplicationLoaded extends ApplicationState {
  final SharedPreferences prefs;
  final String source;

  const ApplicationLoaded({this.source, this.prefs});

  List<Object> get props => [prefs, source];
}

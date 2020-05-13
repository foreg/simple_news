import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  @override
  ApplicationState get initialState => ApplicationInitial();

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is LoadApplication) {
      final prefs = await SharedPreferences.getInstance();
      yield ApplicationLoaded(prefs: prefs);
    }
  }
}

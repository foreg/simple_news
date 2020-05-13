import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_news/bloc/application_bloc.dart';
import 'package:simple_news/bloc/news_bloc.dart';
import 'package:simple_news/pages/splash_screen.dart';
import 'package:simple_news/repository/news_repository.dart';
import 'package:simple_news/widgets/news_list.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        if (state is ApplicationInitial) {
          return SplashScreen();
        }
        if (state is ApplicationLoaded) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Simple news'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      child: Icon(Icons.settings),
                      // onTap: onSettingTap(),
                    ),
                  )
                ],
              ),
              body: BlocProvider(
                create: (context) => NewsBloc(newsRepository: NewsRepository()),
                child: NewsList(),
              ),
            ),
          );
        }
      },
    );
  }
}

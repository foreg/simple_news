import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

import 'package:simple_news/bloc/application_bloc.dart';
import 'package:simple_news/bloc/news_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            if (state is ApplicationLoaded) {
              return Column(
                children: [
                  Tuple2<String, String>('all', 'All'),
                  Tuple2<String, String>('nyt', 'The New York Times'),
                  Tuple2<String, String>(
                      'inyt', 'The International New York Times'),
                ]
                    .map(
                      (e) => RadioListTile(
                        title: Text(e.item2),
                        value: e.item1,
                        groupValue: state.source,
                        onChanged: (String value) {
                          BlocProvider.of<ApplicationBloc>(context)
                            ..add(UpdateSettings(source: value));
                          BlocProvider.of<NewsBloc>(context).add(Clear());
                          BlocProvider.of<NewsBloc>(context).add(Fetch(source: value));
                        },
                      ),
                    )
                    .toList(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_news/bloc/application_bloc.dart';
import 'package:simple_news/bloc/news_bloc.dart';
import 'package:simple_news/models/news.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsBloc _newsBloc;
  ApplicationBloc _applicationBloc;
  ScrollController _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    _newsBloc = BlocProvider.of<NewsBloc>(context)
      ..add(
        Fetch(source: (_applicationBloc.state as ApplicationLoaded).source),
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _newsBloc.add(
          Fetch(source: (_applicationBloc.state as ApplicationLoaded).source));
    }
  }

  Widget _buildTile(News news) {
    return Column(
      children: [
        ListTile(
          leading: SizedBox.fromSize(
            child: Image.network(news.thumbnailStandard),
            size: Size(75, 75),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
          subtitle: Text(news.source),
          title: Text(news.title),
          onTap: () =>
              Navigator.pushNamed(context, '/news_detail', arguments: news),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsError) {
          return Center(
            child: Text('An error occured'),
          );
        } else if (state is NewsLoaded) {
          if (state.news.isEmpty) {
            return Center(
              child: Text('no news'),
            );
          }
          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (context, index) => index >= state.news.length
                ? Center(child: CircularProgressIndicator())
                : _buildTile(state.news[index]),
            itemCount: state.news.length + 1,
          );
        }
        return Container();
      },
    );
  }
}

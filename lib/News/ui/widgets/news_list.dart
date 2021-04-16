import 'package:arg_msjz/News/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../constants.dart';

class NewsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: kDefaultPadding, right: kDefaultPadding),
      child: Container(
        child: SingleChildScrollView(
            child: StreamBuilder(
          stream: newsBloc.newsStream(),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                return Column(
                  children:
                      newsBloc.buildNews(list: snapshot.data.docs),
                );
              default:
                return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ),
    );
  }
}

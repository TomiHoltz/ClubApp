import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/bloc/club_bloc.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SportsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ClubBloc clubBloc = BlocProvider.of<ClubBloc>(context);
    JournalistBloc journalistBloc = BlocProvider.of<JournalistBloc>(context);
    return Container(
      child: StreamBuilder(
        stream: journalistBloc.sportsStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return Column(
                children: clubBloc.buildSports(list: snapshot.data.docs),
              );
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

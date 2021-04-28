import 'package:arg_msjz/Club/repository/club_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arg_msjz/Club/ui/widgets/sport_button.dart';
import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ClubBloc implements Bloc {
  final ClubRepository _clubRepository =
      ClubRepository();

  //build Sports Buttons in SportsScreen
  List<SportButton> buildSports({@required List<DocumentSnapshot> list}) =>
      _clubRepository.buildSports(list: list);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

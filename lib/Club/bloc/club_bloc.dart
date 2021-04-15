import 'package:arg_msjz/Club/repository/sports_information/cloud_firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arg_msjz/Club/ui/widgets/sport_button.dart';
import 'package:flutter/material.dart';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ClubBloc implements Bloc {
  final CloudFirestoreRepository _cloudFirestoreRepository =
      CloudFirestoreRepository();

  //build Sports Buttons in SportsScreen
  List<SportButton> buildSports({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreRepository.buildSports(list: list);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

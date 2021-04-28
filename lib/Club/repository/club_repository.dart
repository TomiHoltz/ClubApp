import 'package:arg_msjz/Club/repository/cloud_firestore_club.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/Club/ui/widgets/sport_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ClubRepository {
  final CloudFirestoreClub _cloudFirestoreClub = CloudFirestoreClub();

  Future<void> uploadNew({@required Sport sportToUpload}) async =>
      _cloudFirestoreClub.uploadSport(sportToUpload: sportToUpload);

  List<SportButton> buildSports({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreClub.buildSports(list: list);
}
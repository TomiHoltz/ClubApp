import 'package:arg_msjz/Club/repository/sports_information/cloud_firestore_api.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/Club/ui/widgets/sport_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreRepository {
  final CloudFirestoreAPI _cloudFirestoreAPI = CloudFirestoreAPI();

  Future<void> uploadNew({@required Sport sportToUpload}) async =>
      _cloudFirestoreAPI.uploadSport(sportToUpload: sportToUpload);

  List<SportButton> buildSports({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreAPI.buildSports(list: list);
}
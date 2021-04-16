import 'package:arg_msjz/Journalists/repository/news_storage/cloud_firestore_api.dart';
import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/Journalists/ui/widgets/editable_sport_card.dart';

class CloudFirestoreRepository {
  final CloudFirestoreAPI _cloudFirestoreAPI = CloudFirestoreAPI();

  Future<void> uploadNew({@required New newToUpload}) async =>
      _cloudFirestoreAPI.uploadNew(newToUpload: newToUpload);

  List<NewCard> buildNews({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreAPI.buildNews(list: list);

  Future<void> uploadSport({@required Sport sportToUpload}) async =>
      _cloudFirestoreAPI.uploadSport(sportToUpload: sportToUpload);

  Future<void> deleteSport({@required Sport sportToDelete}) async =>
      _cloudFirestoreAPI.deleteSport(sportToDelete: sportToDelete);

  List<EditableSportCard> buildEditableSportsCards(
          {@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreAPI.buildEditableSportsCards(list: list);
}

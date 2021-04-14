import 'package:arg_msjz/News/repository/news_storage/cloud_firestore_api.dart';
import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreRepository {
  final CloudFirestoreAPI _cloudFirestoreAPI = CloudFirestoreAPI();

  Future<void> uploadNew({@required New newToUpload}) async =>
      _cloudFirestoreAPI.uploadNew(newToUpload: newToUpload);

  List<NewCard> buildNews({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreAPI.buildNews(list: list);
}

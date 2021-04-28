import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:arg_msjz/Journalists/repository/news_storage/cloud_firestore_repository.dart';
import 'package:arg_msjz/Journalists/repository/news_storage/cloud_firestore_api.dart';

class NewsBloc implements Bloc {
  final CloudFirestoreRepository _cloudFirestoreRepository =
      CloudFirestoreRepository();

  //Build news in the feed
  List<NewCard> buildNews({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreRepository.buildNews(list: list);

  //Listening the "news collection"
  Stream<QuerySnapshot> newsStream() => FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().NEWS).orderBy('timestamp', descending: true)
      .snapshots();

  @override
  void dispose() {}
}

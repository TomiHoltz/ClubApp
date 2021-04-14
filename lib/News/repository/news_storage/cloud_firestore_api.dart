import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreAPI {
  final FirebaseFirestore dataBase = FirebaseFirestore.instance;

  final String NEWS = "news";

  Future<void> uploadNew({@required New newToUpload}) async {
    CollectionReference refNew = dataBase.collection(NEWS);

    await refNew.doc(newToUpload.title).set({
      'title': newToUpload.title,
      'description': newToUpload.description,
      'date': newToUpload.date,
      'seccion': newToUpload.section,
      'timestamp': newToUpload.timestamp,
      'image': newToUpload.image
    });
  }

  List<NewCard> buildNews({@required List<DocumentSnapshot> list}) {
    List<NewCard> newsCards = <NewCard>[];
    list.forEach((news) {
      newsCards.add(NewCard(
        newForThisCard: New(
            isAGalleryImage: false,
            isAnAssetImage: false,
            isANetworkImage: true,
            title: news.data()['title'],
            description: news.data()['description'],
            section: news.data()['seccion'],
            date: news.data()['date'],
            image: news.data()['image']),
      ));
    });
    return newsCards;
  }
}

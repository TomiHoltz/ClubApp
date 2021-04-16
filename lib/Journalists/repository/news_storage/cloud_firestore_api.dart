import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/Journalists/ui/widgets/editable_sport_card.dart';

class CloudFirestoreAPI {
  final FirebaseFirestore dataBase = FirebaseFirestore.instance;

  final String NEWS = "news";
  final String SPORTS = 'sports';
  final String SPORTCATEGORIES = 'categories';

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

  Future<void> uploadSport({@required Sport sportToUpload}) async {
    CollectionReference refNew = dataBase.collection(SPORTS);

    await refNew.doc(sportToUpload.sport).set({
      'sport': sportToUpload.sport,
      'trainingPlace': sportToUpload.trainingPlace,
      'coachesName': sportToUpload.coachesName,
    }).whenComplete(() {
      sportToUpload.categories.forEach((category) {
        refNew
            .doc(sportToUpload.sport)
            .collection(SPORTCATEGORIES)
            .doc(category.category)
            .set({'schedule': category.schedule});
      });
    });
  }

  Future<void> deleteSport({@required Sport sportToDelete}) async {
    CollectionReference refNew = dataBase.collection(SPORTS);

    await refNew.doc(sportToDelete.sport).delete();
  }

  List<EditableSportCard> buildEditableSportsCards(
      {@required List<DocumentSnapshot> list}) {
    List<EditableSportCard> sportCards = <EditableSportCard>[];
    list.forEach((sport) {
      sportCards.add(EditableSportCard(
          sport: Sport(
              sport: sport.data()['sport'],
              trainingPlace: sport.data()['trainingPlace'],
              coachesName: sport.data()['coachesName'])));
    });
    return sportCards;
  }
}

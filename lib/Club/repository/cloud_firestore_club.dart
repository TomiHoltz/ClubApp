import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/Club/ui/widgets/sport_button.dart';

class CloudFirestoreClub {
  final FirebaseFirestore dataBase = FirebaseFirestore.instance;

  final String SPORTS = "sports";

  Future<void> uploadSport({@required Sport sportToUpload}) async {
    CollectionReference refNew = dataBase.collection(SPORTS);

    await refNew.doc(sportToUpload.sport.toLowerCase()).set({
      'sport': sportToUpload.sport,
    });
  }

  List<SportButton> buildSports({@required List<DocumentSnapshot> list}) {
    List<SportButton> newsCards = <SportButton>[];
    list.forEach((sport) {
      newsCards.add(SportButton(
        sport: Sport(
            sport: sport.data()['sport'],
            trainingPlace: sport.data()['trainingPlace'],
            coachesName: sport.data()['coachesName']
      )));
    });
    return newsCards;
  }

}
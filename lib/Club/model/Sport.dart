import 'package:flutter/material.dart';

class Sport {
  final String sport;
  final String trainingPlace;
  final String coachesName;
  final List<Categories> categories;

  Sport(
      {@required this.sport,
      @required this.trainingPlace,
      @required this.coachesName,
      this.categories});
}

class Categories {
  final String category;
  final String schedule;

  Categories(
      {@required this.category,
      @required this.schedule});
}

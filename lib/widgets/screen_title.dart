import 'package:flutter/material.dart';

import '../constants.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    Key key,
    @required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kDefaultPadding * 4),
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "Lato", fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}
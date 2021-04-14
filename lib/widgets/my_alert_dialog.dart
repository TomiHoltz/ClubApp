import 'package:flutter/material.dart';

import '../constants.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    Key key,
    @required this.title,
    this.actions
  }) : super(key: key);

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kSecondaryColor,
      title: Text(title),
      actions: actions
    );
  }
}
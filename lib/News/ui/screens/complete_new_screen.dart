import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/complete_new.dart';
import 'package:arg_msjz/constants.dart';
import 'package:flutter/material.dart';

class CompleteNewScreen extends StatelessWidget {
  final New newForThisScreen;

  CompleteNewScreen({@required this.newForThisScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          newForThisScreen.section,
          style: TextStyle(color: kDarkBlackColor, fontFamily: "Lato"),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: kDarkBlackColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: CompleteNew(newForThisScreen: newForThisScreen),
    );
  }
}


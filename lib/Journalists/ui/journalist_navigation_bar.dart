import 'package:arg_msjz/Journalists/ui/screens/journalist_news.dart';
import 'package:arg_msjz/Journalists/ui/screens/journalist_sports.dart';
import 'package:arg_msjz/constants.dart';
import 'package:flutter/material.dart';

class JournalistNavigationBar extends StatefulWidget {
  @override
  _JournalistNavigationBarState createState() => _JournalistNavigationBarState();
}

class _JournalistNavigationBarState extends State<JournalistNavigationBar> {

  int indexTap = 0;

  final List<Widget> widgetsChildren = [
    JournalistNews(),
    JournalistSports(),
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
        canvasColor: kSecondaryColor,
        primaryColor: kPrimaryColor,
      ),
      child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Noticias"),
              BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Deportes"),
            ]),
      )
    );
  }
}
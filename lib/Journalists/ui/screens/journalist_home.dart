import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/widgets/control_panel_fab.dart';
import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'add_news_screen.dart';

class JournalistHome extends StatefulWidget {
  @override
  _JournalistHomeState createState() => _JournalistHomeState();
}

class _JournalistHomeState extends State<JournalistHome> {
  bool isAddActive = false;
  bool isDeleteActive;

  Widget addNews() {
    if (isAddActive) {
      return AddNewsScreen();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    JournalistBloc journalistBloc = BlocProvider.of<JournalistBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
              child: Stack(
          children: [
            BackgroundGradient(),
            Column(
              children: [
                //Title
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding * 3),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Panel de control",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                ),
                //Fabs
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ControlPanelFAB(
                        mini: true,
                        icon: Icons.logout,
                        iconSize: 20,
                        onPressed: () {
                          journalistBloc.signOut();
                        },
                        heroTag: "LogOut Btn",
                      ),
                      ControlPanelFAB(
                        mini: false,
                        icon: Icons.add,
                        iconSize: 40,
                        onPressed: () {
                          setState(() {
                            if (!isAddActive) {
                              isAddActive = true;
                            } else if (isAddActive = true) {
                              isAddActive = false;
                            }
                          });
                        },
                        heroTag: "Add Btn",
                      ),
                      ControlPanelFAB(
                        mini: true,
                        icon: Icons.delete,
                        iconSize: 20,
                        onPressed: () {},
                        heroTag: "Delete btn",
                      ),
                    ],
                  ),
                ),
                Container(
                  child: addNews(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/widgets/control_panel_fab.dart';
import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:arg_msjz/widgets/screen_title.dart';
import '../widgets/add_news.dart';

class JournalistNews extends StatefulWidget {
  @override
  _JournalistNewsState createState() => _JournalistNewsState();
}

class _JournalistNewsState extends State<JournalistNews> {
  bool isAddActive = true;
  bool isDeleteActive;

  Widget addNews() {
    if (isAddActive) {
      return AddNews();
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
                ScreenTitle(title: "Agregar noticias",),
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
                        onPressed: () {},
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



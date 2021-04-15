import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:arg_msjz/widgets/drawer/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/widgets/screen_title.dart';
import 'package:arg_msjz/Club/ui/widgets/sports_list.dart';


class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
      drawer: MenuDrawer(),
      body: Container(
        child: SingleChildScrollView(
            child: Stack(
          children: [
            BackgroundGradient(),
            //Title
            Column(
              children: [
                ScreenTitle(title: "Deportes"),
                SportsList()
              ],
            ),
          ],
        )),
      ),
    );
  }
}

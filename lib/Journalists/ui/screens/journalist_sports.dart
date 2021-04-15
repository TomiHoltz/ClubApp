import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/widgets/screen_title.dart';

class JournalistSports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundGradient(),
            Column(
              children: [
                ScreenTitle(title: "Deportes"),
                SizedBox(height: kDefaultPadding,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:arg_msjz/widgets/drawer/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/widgets/screen_title.dart';
import 'package:arg_msjz/Club/ui/widgets/social_media_buttons.dart';
import 'package:arg_msjz/Club/ui/widgets/more_information.dart';


class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
      drawer: MenuDrawer(),
      body: Stack(
        children: [
          BackgroundGradient(),
          Column(
            children: [
              ScreenTitle(title: "Contacto"),
              SizedBox(height: kDefaultPadding),
              //Social media buttons
              SocialMediaButtons(),
              MoreInformation()
            ],
          ),
        ],
      ),
    );
  }
}


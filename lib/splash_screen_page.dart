import 'package:arg_msjz/club_home.dart';
import 'package:arg_msjz/constants.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      backgroundColor: kSecondaryColor,
      image: Image.asset('assets/arg.png'),
      photoSize: 80,
      useLoader: true,
      loaderColor: kPrimaryColor,
      loadingText: Text("By StartClub", style: TextStyle(color: kAccentColor, fontFamily: "Lato", fontWeight: FontWeight.bold)),
      navigateAfterSeconds: ClubHome(),
    );
  }
}

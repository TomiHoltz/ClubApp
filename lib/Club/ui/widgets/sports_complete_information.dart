import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/widgets/screen_title.dart';

class SportCompleteInformation extends StatelessWidget {
  final Sport sport;

  const SportCompleteInformation({Key key, @required this.sport})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kDarkBlackColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: Stack(
          children: [
            BackgroundGradient(),
            //Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScreenTitle(title: sport.sport),
                SizedBox(height: kDefaultPadding,),
                Column(
                  children: [
                    //Training Place
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text("Sede: ${sport.trainingPlace}", style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),),
                    ),
                    SizedBox(height: kDefaultPadding),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text("Entrenadores: ${sport.coachesName}", style: TextStyle(                        
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),),
                    )
                  ],
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

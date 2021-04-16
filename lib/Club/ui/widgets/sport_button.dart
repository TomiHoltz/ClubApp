import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:page_transition/page_transition.dart';
import '../../../constants.dart';
import 'package:arg_msjz/Club/ui/widgets/sports_complete_information.dart';

class SportButton extends StatelessWidget {
  const SportButton({Key key, @required this.sport}) : super(key: key);

  final Sport sport;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      margin: EdgeInsets.all(kDefaultPadding / 2),
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.red, blurRadius: 5.0, offset: Offset(0.0, 0.5))
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: SportCompleteInformation(sport: sport,),
                  type: PageTransitionType.rightToLeft));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sport.sport,
                style: TextStyle(fontFamily: "Lato", fontSize: 15)),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

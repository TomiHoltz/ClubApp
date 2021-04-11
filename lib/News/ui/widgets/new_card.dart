import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/screens/complete_new_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants.dart';

class NewCard extends StatelessWidget {
  final New newForThisCard;

  NewCard({@required this.newForThisCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
        child: Column(
          children: [
            //Image
            AspectRatio(
                aspectRatio: 2.0,
                child: Image.asset(
                  newForThisCard.image,
                  fit: BoxFit.cover,
                )),
            //Post Information
            Container(
              padding: EdgeInsets.all(kDefaultPadding * 0.75),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Section and Date
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newForThisCard.section.toUpperCase(),
                        style: TextStyle(
                          color: kDarkBlackColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Text(newForThisCard.date,
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  //Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        newForThisCard.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 24.0,
                            color: kDarkBlackColor,
                            fontFamily: 'Raleway',
                            height: 1.3,
                            fontWeight: FontWeight.w600)),
                  ),
                  //Description
                  Text(
                    newForThisCard.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(height: 1.5),
                  ),
                  //Read more button
                  SizedBox(height: kDefaultPadding),
                  TextButton(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: kPrimaryColor, width: 3))),
                      child: Text(
                        "Leer mas",
                        style: TextStyle(color: kDarkBlackColor),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                              context,
                              PageTransition(
                                  child: CompleteNewScreen(newForThisScreen: newForThisCard,), type:PageTransitionType.bottomToTop));
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

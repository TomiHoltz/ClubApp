import 'dart:io';

import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/screens/complete_new_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants.dart';

class NewCard extends StatefulWidget {
  final New newForThisCard;

  NewCard({
    @required this.newForThisCard,
  });

  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  selectImage() {
    if (widget.newForThisCard.thereIsNoImage) {
      return Container(
        color: kSecondaryColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.photo_camera), Text("Selecciona una foto")],
          ),
        ),
      );
    } else if (widget.newForThisCard.isAGalleryImage) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(File(widget.newForThisCard.image)),
                fit: BoxFit.cover)),
      );
    } else if (widget.newForThisCard.isANetworkImage) {
      return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.newForThisCard.image),
                  fit: BoxFit.cover)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: kDefaultPadding / 2, bottom: kDefaultPadding / 2),
        child: Column(
          children: [
            //Image
            AspectRatio(aspectRatio: 2.0, child: selectImage()),
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
                        widget.newForThisCard.section.toUpperCase(),
                        style: TextStyle(
                          color: kDarkBlackColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Text(widget.newForThisCard.date,
                          style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                  //Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(widget.newForThisCard.title,
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
                    widget.newForThisCard.description,
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
                              child: CompleteNewScreen(
                                newForThisScreen: widget.newForThisCard,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

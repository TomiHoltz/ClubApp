import 'dart:io';

import 'package:arg_msjz/News/model/New.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CompleteNew extends StatefulWidget {
  const CompleteNew({
    Key key,
    @required this.newForThisScreen,
  }) : super(key: key);

  final New newForThisScreen;

  @override
  _CompleteNewState createState() => _CompleteNewState();
}

class _CompleteNewState extends State<CompleteNew> {
  selectImage() {
    if (widget.newForThisScreen.isAnAssetImage) {
      return Image.asset(
        widget.newForThisScreen.image,
        fit: BoxFit.cover,
      );
    } else if (widget.newForThisScreen.isAGalleryImage) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: FileImage(File(widget.newForThisScreen.image)),
                fit: BoxFit.cover)),
      );
    } else if (widget.newForThisScreen.isANetworkImage) {
      return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.newForThisScreen.image),
                  fit: BoxFit.cover)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: selectImage()
            ),
            Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Date
                    Container(
                      child: Text(
                        widget.newForThisScreen.date,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    //Title
                    Container(
                      child: Text(
                        widget.newForThisScreen.title,
                        style: TextStyle(
                            fontSize: 24.0,
                            color: kDarkBlackColor,
                            fontFamily: 'Raleway',
                            height: 1.3,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    //Description
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      child: Text(
                        widget.newForThisScreen.description,
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

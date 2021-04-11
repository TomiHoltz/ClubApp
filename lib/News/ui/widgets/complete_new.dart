import 'package:arg_msjz/News/model/New.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CompleteNew extends StatelessWidget {
  const CompleteNew({
    Key key,
    @required this.newForThisScreen,
  }) : super(key: key);

  final New newForThisScreen;

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
              child: Image.asset(
                newForThisScreen.image,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Date
                    Container(
                      child: Text(
                        newForThisScreen.date,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                    //Title
                    Container(
                      child: Text(
                        newForThisScreen.title,
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
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                      child: Text(
                        newForThisScreen.description,
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

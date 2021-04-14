import 'package:flutter/material.dart';
import 'package:arg_msjz/constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: InkWell(
          onTap: onPressed,
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor)))),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: kPrimaryColor),
    );
  }
}

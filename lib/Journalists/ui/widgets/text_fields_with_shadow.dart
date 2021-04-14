import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextFieldWithShadow extends StatelessWidget {
  const TextFieldWithShadow({
    Key key,
    @required this.controller,
    @required this.hintText,
    this.icon,
    this.onChanged
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          //fillColor: kPrimaryColor,
          suffixIcon: Icon(icon),
        ),
      ),
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black, blurRadius: 15.0, offset: Offset(0.0, 5.0))
          ]),
    );
  }
}
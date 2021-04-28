import 'package:flutter/material.dart';

import '../../../constants.dart';

class TextFieldWithShadow extends StatelessWidget {
  const TextFieldWithShadow(
      {Key key,
      @required this.controller,
      @required this.hintText,
      this.icon,
      this.maxLines,
      this.height,
      this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Function(String) onChanged;
  final int maxLines;
  final double height; //We are goig to use it just if maxLines > 1

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
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

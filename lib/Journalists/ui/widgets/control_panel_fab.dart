import 'package:flutter/material.dart';

import '../../../constants.dart';

class ControlPanelFAB extends StatelessWidget {
  const ControlPanelFAB({
    Key key,
    @required this.mini,
    @required this.icon,
    @required this.iconSize,
    @required this.onPressed,
    @required this.heroTag
  }) : super(key: key);

  final bool mini;
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: kSecondaryColor,
      child: Icon(icon, color: kPrimaryColor, size: iconSize),
      mini: mini,
      heroTag: heroTag,
    );
  }
}

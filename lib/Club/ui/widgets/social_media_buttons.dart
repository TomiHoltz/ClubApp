import 'package:arg_msjz/Club/ui/screens/web_view_screen.dart';
import 'package:arg_msjz/Club/ui/widgets/social_media_icons.dart';
import 'package:arg_msjz/Journalists/ui/widgets/control_panel_fab.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ControlPanelFAB(
            mini: true,
            icon: SocialMediaIcons.instagram,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: WebViewScreen(
                          url: "https://www.instagram.com/argmsjz/"),
                      type: PageTransitionType.bottomToTop));
            },
            heroTag: "INSTAGRAM btn"),
        ControlPanelFAB(
            mini: true,
            icon: SocialMediaIcons.facebook_1,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: WebViewScreen(
                          url: "https://www.facebook.com/argmsjz"),
                      type: PageTransitionType.bottomToTop));
            },
            heroTag: "FACEBOOK btn"),
        ControlPanelFAB(
            mini: true,
            icon: SocialMediaIcons.youtube,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: WebViewScreen(
                          url: "https://www.youtube.com/channel/UCuzqBZ3dJ_WIIA4bJHZga3Q"),
                      type: PageTransitionType.bottomToTop));
            },
            heroTag: "YOUTUBE btn"),
        ControlPanelFAB(
            mini: true,
            icon: SocialMediaIcons.twitter,
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: WebViewScreen(
                          url: "https://twitter.com/argmsjz?lang=es"),
                      type: PageTransitionType.bottomToTop));
            },
            heroTag: "TWITTER btn"),
      ],
    );
  }
}

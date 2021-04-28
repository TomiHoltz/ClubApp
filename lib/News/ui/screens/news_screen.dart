import 'package:arg_msjz/Journalists/ui/widgets/handle_journalist_signin.dart';
import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/drawer/menu_controller.dart';
import 'package:arg_msjz/widgets/drawer/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:arg_msjz/News/ui/widgets/news_list.dart';

class NewsScreen extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldfKey,
      drawer: MenuDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Noticias"),
        actions: [
          IconButton(
            icon: Icon(Icons.mic, color: kSecondaryColor),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: HandleJournalistSignIn(),
                      type: PageTransitionType.rightToLeft));
            },
          )
        ],
      ),
      body: NewsList(),
    );
  }
}


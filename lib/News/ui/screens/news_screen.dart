import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/widgets/handle_journalist_signin.dart';
import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/drawer/menu_controller.dart';
import 'package:arg_msjz/widgets/drawer/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class NewsScreen extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    JournalistBloc journalistBloc = BlocProvider.of<JournalistBloc>(context);
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
                      type: PageTransitionType.leftToRight));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding),
        child: Container(
          child: SingleChildScrollView(
              child: StreamBuilder(
            stream: journalistBloc.newsStream(),
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  return Column(
                    children:
                        journalistBloc.buildNews(list: snapshot.data.docs),
                  );
                default:
                  return Center(child: CircularProgressIndicator());
              }
            },
          )),
        ),
      ),
    );
  }
}

import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/widgets/background_gradient.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/widgets/screen_title.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:arg_msjz/Journalists/ui/widgets/add_sport_modal_bottom_sheet.dart';

class JournalistSports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    JournalistBloc journalistBloc = BlocProvider.of<JournalistBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundGradient(),
            Column(
              children: [
                ScreenTitle(title: "Deportes"),
                SizedBox(height: kDefaultPadding / 2),
                //Add Sport Button
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return AddSportModalBottomSheet();
                          });
                    },
                    child: Text("Agregar deporte",
                        style: TextStyle(color: kDarkBlackColor))),
                SizedBox(height: kDefaultPadding / 2),
                //SportCard
                StreamBuilder(
                  stream: journalistBloc.sportsStream(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                      case ConnectionState.done:
                        return Column(
                          children: journalistBloc.buildEditableSportCards(
                              list: snapshot.data.docs),
                        );
                      default:
                        return Center(child: CircularProgressIndicator());
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


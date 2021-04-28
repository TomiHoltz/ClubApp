import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/widgets/my_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../constants.dart';

class EditableSportCard extends StatelessWidget {
  const EditableSportCard({Key key, @required this.sport}) : super(key: key);

  final Sport sport;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      width: double.infinity,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              //Sport
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        sport.sport,
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding * 0.25),
                    //Training place
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Lugar de entrenamiento: ${sport.trainingPlace}",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(height: kDefaultPadding * 0.25),
                    //Coaches name
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Entrenadores: ${sport.coachesName}",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontFamily: "Lato",
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return MyAlertDialog(
                                  title:
                                      "Seguro quieres eliminar ${sport.sport}",
                                  actions: [
                                    TextButton(
                                      child: Text("Si"),
                                      onPressed: () {
                                        BlocProvider.of<JournalistBloc>(context)
                                            .deleteSport(sportToDelete: sport);
                                      },
                                    ),
                                    TextButton(
                                      child: Text("No"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                        }),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

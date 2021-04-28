import 'package:arg_msjz/Journalists/ui/widgets/text_fields_with_shadow.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:arg_msjz/Journalists/ui/widgets/add_categories_modal_bottom_sheet.dart';
import '../../../constants.dart';

class AddSportModalBottomSheet extends StatelessWidget {
  final TextEditingController sportController = TextEditingController();
  final TextEditingController trainingPlaceController = TextEditingController();
  final TextEditingController coachesNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          color: kSecondaryColor),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Divider(
              thickness: 4.0,
              color: kDarkBlackColor,
            ),
          ),
          //Title
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "Agregar Deporte",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          //Add Sport TextField
          TextFieldWithShadow(
            hintText: "Deporte (Ej: Futbol)",
            controller: sportController,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          //Add training TextField
          TextFieldWithShadow(
            hintText: "Lugar de entrenamiento",
            controller: trainingPlaceController,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          //Add coaches name TextField
          TextFieldWithShadow(
            hintText: "Nombre de los entrenadores",
            controller: coachesNameController,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          //"Next" Button
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return AddCategoriesModalBottomSheet(
                          sport: Sport(
                              sport: sportController.text,
                              trainingPlace: trainingPlaceController.text,
                              coachesName: coachesNameController.text),
                        );
                      });
                },
                child: Text("Siguiente",
                    style: TextStyle(color: kDarkBlackColor))),
          )
        ],
      ),
    );
  }
}


import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/widgets/text_fields_with_shadow.dart';
import 'package:arg_msjz/widgets/my_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:arg_msjz/Club/model/Sport.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../constants.dart';


class AddCategoriesModalBottomSheet extends StatefulWidget {
  final Sport sport;

  AddCategoriesModalBottomSheet({Key key, @required this.sport})
      : super(key: key);

  @override
  _AddCategoriesModalBottomSheetState createState() =>
      _AddCategoriesModalBottomSheetState();
}

class _AddCategoriesModalBottomSheetState
    extends State<AddCategoriesModalBottomSheet> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController scheduleController = TextEditingController();
  List<Categories> categoriesList = [];

  List<Widget> showCategories() {
    List<Widget> categoriesToShow = [];
    categoriesList.forEach((category) {
      categoriesToShow.add(Text("${category.category}: ${category.schedule}"));
    });
    return categoriesToShow;
  }

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
              "Agregar Categorias",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          //Add Categorie TextField
          TextFieldWithShadow(
            hintText: "Categoria",
            controller: categoryController,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          //Add schedule TextField
          TextFieldWithShadow(
            hintText: "Horarios",
            controller: scheduleController,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Column(children: showCategories()),
          //"Next" Button
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    categoriesList.add(Categories(
                        category: categoryController.text,
                        schedule: scheduleController.text));
                    showCategories();
                    categoryController.clear();
                    scheduleController.clear();
                  });
                },
                child:
                    Text("Agregar", style: TextStyle(color: kDarkBlackColor))),
          ),
          //"Next" Button
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return MyAlertDialog(
                          title:
                              "Seguro que quieres agregar ${widget.sport.sport}",
                          actions: [
                            TextButton(
                              child: Text("No"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text("Si"),
                              onPressed: () {
                                BlocProvider.of<JournalistBloc>(context)
                                    .uploadSport(
                                        sportToUpload: Sport(
                                            sport: widget.sport.sport,
                                            trainingPlace:
                                                widget.sport.trainingPlace,
                                            coachesName:
                                                widget.sport.coachesName,
                                            categories: categoriesList))
                                    .whenComplete(() => Navigator.pop(context));
                              },
                            )
                          ],
                        );
                      });
                },
                child: Text("Subir", style: TextStyle(color: kDarkBlackColor))),
          )
        ],
      ),
    );
  }
}

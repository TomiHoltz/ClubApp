import 'dart:io';
import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/widgets/control_panel_fab.dart';
import 'package:arg_msjz/Journalists/ui/widgets/submit_button.dart';
import 'package:arg_msjz/Journalists/ui/widgets/text_fields_with_shadow.dart';
import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:arg_msjz/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:arg_msjz/widgets/my_alert_dialog.dart';
import 'package:image_picker/image_picker.dart';

class AddNews extends StatefulWidget {
  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController seccionController = TextEditingController();

  String cardTitle = "Titulo Ejemplo";
  String cardDescription = "Descripcion ejemplo";
  String cardSeccion = "Seccion ejemplo";
  String cardImagePath = 'assets/basq.jpg';
  String cardDate =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

  bool thereIsNoImage = true;
  bool isAGalleryImage = false;
  bool isANetworkImage = false;
  ImagePicker picker = ImagePicker();

  cardState() {
    setState(() {
      cardTitle = titleController.text;
      cardDescription = descriptionController.text;
      cardSeccion = seccionController.text;
      cardDate =
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    });
  }

  pickImage() {
    picker.getImage(source: ImageSource.gallery).then((value) {
      setState(() {
        cardImagePath = value.path;
        thereIsNoImage = false;
        isAGalleryImage = true;
      });
    });
  }

  void uploadNew() {
    BlocProvider.of<JournalistBloc>(context)
        .getImageUrl(image: File(cardImagePath), path: titleController.text)
        .then((imageUrl) {
      BlocProvider.of<JournalistBloc>(context)
          .uploadNew(
              newToUpload: New(
                  title: titleController.text,
                  description: descriptionController.text,
                  section: seccionController.text,
                  date: cardDate,
                  image: imageUrl,
                  timestamp: Timestamp.now()))
          .whenComplete(() {
        Navigator.pop(context);
        setState(() {
          cardTitle = "Titulo Ejemplo";
          cardDescription = "Descripcion Ejemplo";
          cardImagePath = 'assets/basq.jpg';
          cardSeccion = "Seccion";
          isAGalleryImage = false;
          thereIsNoImage = true;
        });
        titleController.clear();
        descriptionController.clear();
        seccionController.clear();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          //Card
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              NewCard(
                  newForThisCard: New(
                      thereIsNoImage: thereIsNoImage,
                      isAGalleryImage: isAGalleryImage,
                      isANetworkImage: false,
                      title: cardTitle,
                      date: cardDate,
                      description: cardDescription,
                      section: cardSeccion,
                      image: cardImagePath)),
              Container(
                margin: EdgeInsets.only(
                    bottom: kDefaultPadding / 2, right: kDefaultPadding),
                child: ControlPanelFAB(
                    mini: true,
                    icon: Icons.photo,
                    iconSize: 25,
                    onPressed: () {
                      pickImage();
                    },
                    heroTag: "PickImage Button"),
              )
            ],
          ),
          //Title TextField
          TextFieldWithShadow(
            controller: titleController,
            hintText: "Title",
            onChanged: (String title) {
              setState(() {
                cardTitle = title;
              });
            },
          ),
          SizedBox(height: kDefaultPadding),
          //Description TextField
          TextFieldWithShadow(
            controller: descriptionController,
            hintText: "Description",
            height: 80.0,
            onChanged: (String description) {
              setState(() {
                cardDescription = description;
              });
            },
          ),
          SizedBox(height: kDefaultPadding),
          //Section TextField
          TextFieldWithShadow(
            controller: seccionController,
            hintText: "Seccion",
            onChanged: (String seccion) {
              setState(() {
                cardSeccion = seccion;
              });
            },
          ),
          SizedBox(height: kDefaultPadding),
          //Button which uploads the new to Firebase
          SubmitButton(
              text: "Subir noticia",
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    seccionController.text.isNotEmpty &&
                    !thereIsNoImage) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return MyAlertDialog(
                          title: "Seguro que quires subir la noticia?",
                          actions: [
                            TextButton(
                                child: Text("No"),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                              child: Text("Si"),
                              onPressed: () {
                                uploadNew();
                              },
                            )
                          ],
                        );
                      });
                } else if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    seccionController.text.isNotEmpty &&
                    thereIsNoImage) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Seleccione una foto del dispositivo")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Por favor rellene todos los campos")));
                }
              })
        ],
      ),
    );
  }
}

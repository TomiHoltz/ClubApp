import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:arg_msjz/constants.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Noticias"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                NewCard(
                  newForThisCard: New(
                    title: "El basquet retoma los entrenamientos este martes",
                    image: "assets/basq.jpg",
                    description: "Después de las prohibiciones del COE durante meses, finalmente se retomarán los entrenamientos con los siguientes protocolos.",
                    date: "23 de septiembre",
                    section: "Basquet"
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

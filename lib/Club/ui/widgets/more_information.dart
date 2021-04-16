import 'package:flutter/material.dart';

class MoreInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 40, right: 30),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Secretaria",
            style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: 5), 
          Text("Horario de atencion: Lunes a viernes de 10 am a 8pm."),
          SizedBox(height: 5), 
          Text(
            "Telefono",
            style: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.underline),
          ),
          SizedBox(height: 5),
          Text("3472000000"),
        ],
      ),
    );
  }
}

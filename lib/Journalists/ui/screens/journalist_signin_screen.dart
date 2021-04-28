import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/Journalists/ui/widgets/submit_button.dart';
import 'package:arg_msjz/Journalists/ui/widgets/text_fields_with_shadow.dart';
import 'package:arg_msjz/constants.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class JournalistSignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    JournalistBloc journalistBloc = BlocProvider.of<JournalistBloc>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: kDarkBlackColor),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        child: ListView(
          children: [
            //Logo
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(clubShieldPhotoPath))),
            ),
            //Title
            Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "¿Eres periodista del club?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //Subtitle
            Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
              child: Text(
                "Inicia sesion y empieza a redactar y subir noticias al feed principal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Lato",
                ),
              ),
            ),
            SizedBox(height: kDefaultPadding * 1.5),
            //Email TextField
            TextFieldWithShadow(
              controller: emailController,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(height: kDefaultPadding),
            //Password TextField
            TextFieldWithShadow(
              controller: passwordController,
              hintText: "Password",
              icon: Icons.lock,
            ),
            SizedBox(height: kDefaultPadding * 1.5),
            SubmitButton(
              text: "Ingresar",
              onPressed: () {
                if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "Ingresa un correo electronico y una contraseña")));
                } else {
                  journalistBloc.signOut();
                  journalistBloc.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

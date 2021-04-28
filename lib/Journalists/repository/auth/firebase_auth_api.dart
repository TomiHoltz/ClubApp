import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User> signIn(
      {@required String email,
      @required String password,
      @required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("Signnnnnnnnnn");
      print(userCredential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                "No se encontro ningun usuario con este correo electronico")));
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Contraseña incorrecta")));
        return null;
      } else if (e.code == 'invalid-email'){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Ingresa un correo valido")));
        return null;
      }
      return null;
    }
  }

  signOut() async {
    await _auth.signOut();
    print("Sesion Cerrada");
  }
}

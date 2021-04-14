import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_auth_api.dart';

class AuthRepository{
  
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<User> signIn({@required String email, @required String password}) =>
      _firebaseAuthAPI.signIn(email: email, password: password);

  signOut() => _firebaseAuthAPI.signOut();
}

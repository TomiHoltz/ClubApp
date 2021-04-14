import 'package:arg_msjz/Journalists/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class JournalistBloc implements Bloc {
  final AuthRepository _authRepository = AuthRepository();

  //Actual User
  Stream<User> currentUserStream = FirebaseAuth.instance.authStateChanges();
  Stream<User> get getCurrentUser => currentUserStream;

  //SignIn with Firebase
  Future<User> signIn({@required String email, @required String password}) =>
      _authRepository.signIn(email: email, password: password);

  @override
  void dispose() {}
}

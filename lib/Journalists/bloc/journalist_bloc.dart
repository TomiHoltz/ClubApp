import 'package:arg_msjz/Journalists/repository/auth/auth_repository.dart';
import 'package:arg_msjz/News/repository/news_storage/cloud_firestore_api.dart';
import 'package:arg_msjz/News/repository/news_storage/cloud_firestore_repository.dart';
import 'package:arg_msjz/News/model/New.dart';
import 'package:arg_msjz/News/ui/widgets/new_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class JournalistBloc implements Bloc {
  final AuthRepository _authRepository = AuthRepository();
  final CloudFirestoreRepository _cloudFirestoreRepository =
      CloudFirestoreRepository();

  //Actual User
  Stream<User> currentUserStream = FirebaseAuth.instance.authStateChanges();
  Stream<User> get getCurrentUser => currentUserStream;

  //SignIn with Firebase
  Future<User> signIn({@required String email, @required String password}) =>
      _authRepository.signIn(email: email, password: password);

  //Sign out with firebase
  signOut() => _authRepository.signOut();

  //Upload New
  Future<void> uploadNew({@required New newToUpload}) async =>
      _cloudFirestoreRepository.uploadNew(newToUpload: newToUpload);

  //Build news in the feed
  List<NewCard> buildNews({@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreRepository.buildNews(list: list);

  //Listening the "news collection"
  Stream<QuerySnapshot> newsStream() => FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().NEWS)
      .snapshots();

 

  @override
  void dispose() {}
}

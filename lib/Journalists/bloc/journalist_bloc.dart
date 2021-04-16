import 'dart:io';
import 'package:arg_msjz/Journalists/repository/auth/auth_repository.dart';
import 'package:arg_msjz/Journalists/repository/news_storage/cloud_firestore_repository.dart';
import 'package:arg_msjz/Journalists/repository/photos_storage/storage_repository.dart';
import 'package:arg_msjz/News/model/New.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:arg_msjz/Journalists/repository/news_storage/cloud_firestore_api.dart';
import 'package:arg_msjz/Journalists/ui/widgets/editable_sport_card.dart';
import 'package:arg_msjz/Club/model/Sport.dart';

class JournalistBloc implements Bloc {
  final AuthRepository _authRepository = AuthRepository();
  final CloudFirestoreRepository _cloudFirestoreRepository =
      CloudFirestoreRepository();
  final StorageRepository _storageRepository = StorageRepository();
  final CloudFirestoreAPI cloudFirestoreAPI = CloudFirestoreAPI();

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

  //Uploading image to firebase
  //We use this method in the begging of 'getImageUrl()' because we we need to
  // get the image's url every time we upload a file
  uploadFile({String path, File image}) async =>
      _storageRepository.uploadFile(path: path, image: image);

  //Getting image's url
  Future<String> getImageUrl({File image, String path}) async {
    final uploadTask = uploadFile(path: path, image: image);
    if (uploadTask == null) {
      print('Null upload task');
      return null;
    }

    final taskSnapshot = await uploadTask;
    if (taskSnapshot == null) {
      print('Null task snapshot');
      return null;
    }

    final imageUrl = await taskSnapshot.ref.getDownloadURL();
    if (imageUrl == null) {
      print('Null image URL');
      return null;
    }

    return (imageUrl);
  }

  //Listening sports collection
  Stream<QuerySnapshot> sportsStream() => FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().SPORTS)
      .orderBy("sport")
      .snapshots();

  //Upload Sport
  Future<void> uploadSport({@required Sport sportToUpload}) async =>
      _cloudFirestoreRepository.uploadSport(sportToUpload: sportToUpload);

  //Delete sport
  Future<void> deleteSport({@required Sport sportToDelete}) async =>
      _cloudFirestoreRepository.deleteSport(sportToDelete: sportToDelete);

  //Building EditableSportCards
  List<EditableSportCard> buildEditableSportCards(
          {@required List<DocumentSnapshot> list}) =>
      _cloudFirestoreRepository.buildEditableSportsCards(list: list);

  @override
  void dispose() {}
}

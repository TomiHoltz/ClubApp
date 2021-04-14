import 'dart:io';
import 'firebase_storage_api.dart';

class StorageRepository {
  final _firebaseStorageAPI = FirebasStorageAPI();

  uploadFile({String path, File image}) async =>
      _firebaseStorageAPI.uploadFile(path: path, image: image);
}
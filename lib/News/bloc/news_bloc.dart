import 'dart:io';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:arg_msjz/News/repository/photos_storage/storage_repository.dart';

class NewsBloc implements Bloc {
  final StorageRepository _storageRepository = StorageRepository();

  //Uploading new's pictures to Firebase Storage anf getting the image's Url
  uploadFile({String path, File image}) async =>
      _storageRepository.uploadFile(path: path, image: image);

  Future<String> getImageUrl({File image, String path}) async {
    final uploadTask =
        uploadFile(path: path, image: image);
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

  @override
  void dispose() {}
}

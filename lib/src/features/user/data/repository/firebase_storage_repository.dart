//import 'dart:html' as html;
import 'dart:io' as io;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStorageRepository {
  FirebaseStorageRepository._();

  static final instance = FirebaseStorageRepository._();

  final _storage = FirebaseStorage.instance;

  Future<String> uploadFile({
    required String path,
    required String filePath,
  }) async {
    final storageRef = _storage.ref().child(path);
    if (kIsWeb) {
      // TODO: add web add file
      //final file = html.File(filePath);
      //uploadTask = storageRef.putData(await file.readAsBytes(), metadata);
      return '';
    } else {
      await storageRef.putFile(io.File(filePath));
    }
    return storageRef.getDownloadURL();
  }
}

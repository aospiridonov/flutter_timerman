import 'package:flutter_timerman/src/core/services/firestore_service.dart';
import 'package:flutter_timerman/src/features/user/data/api/api_path.dart'
    show APIPath;
import 'package:flutter_timerman/src/features/user/data/repository/firebase_storage_repository.dart';
import 'package:flutter_timerman/src/features/user/domain/models/user.dart';
import 'package:flutter_timerman/src/features/user/domain/repository/user_repository.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreUserRepository extends UserRepository {
  final _service = FirestoreService.instance;
  final _storage = FirebaseStorageRepository.instance;

  @override
  Stream<User> getUser({required String userId}) =>
      _service.documentStream<User>(
        path: APIPath.user(userId),
        builder: (data, documentId) {
          return User.fromJson(data).copyWith(id: userId);
        },
      );

  @override
  Future<void> addUser(User user) async {
    //TODO: check photo url
    return _service.setData(path: APIPath.user(user.id), data: user.toJson());
  }
  //_service.addData(path: APIPath.user(user.id), data: user.toJson());

  @override
  Future<void> deleteUser(User user) async {
    //TODO: add delete recursive events
    await _service.deleteData(documentPath: APIPath.user(user.id));
  }

  @override
  Future<void> updateUser(User user) async {
    var newUser = user;
    if (!user.imageUrl.contains('http')) {
      final imageUrl = await _storage.uploadFile(
        path: 'users/avatar/${user.id}',
        filePath: user.imageUrl,
      );
      newUser = user.copyWith(imageUrl: imageUrl);
    }
    return _service.setData(
      path: APIPath.user(newUser.id),
      data: newUser.toJson(),
    );
  }
}

import 'package:flutter_timerman/src/features/user/domain/models/models.dart';

abstract class UserApi {
  const UserApi();

  Stream<User> getUser();

  Future<void> saveUser(User user);
  Future<void> deleteUser(String id);
}

class UserNotFoundException implements Exception {}

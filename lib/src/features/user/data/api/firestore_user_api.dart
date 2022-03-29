import 'user_api.dart' show UserApi;
import 'package:flutter_timerman/src/features/user/domain/models/user.dart';

class FirestoreUserApi extends UserApi {

  
  @override
  Future<void> deleteUser(String id) {
    throw UnimplementedError();
  }

  @override
  Stream<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}

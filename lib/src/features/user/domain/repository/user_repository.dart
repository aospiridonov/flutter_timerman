import 'package:flutter_timerman/src/features/user/domain/models/models.dart';

abstract class UserRepository {
  Stream<User> getUser({required String userId});
  Future<void> addUser(User user);
  Future<void> deleteUser(User user);
  Future<void> updateUser(User user);

  //Stream<List<Event>> entriesStream({User? user})
}

import 'package:flutter_timerman/src/features/user/domain/models/user.dart';
import 'package:flutter_timerman/src/features/user/domain/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';
import 'dart:convert';
import 'dart:async';

class LocalStorageUserRepository extends UserRepository {
  LocalStorageUserRepository({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  static const kUserCollectionKey = '__user_collection_key__';
  static const kCurrentUserIdKey = '__current_user_id_key__';
  final _userStreamController = BehaviorSubject<User>();

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  List<User> _users() {
    final usersJson = _getValue(kUserCollectionKey);
    late final List<User> users;
    if (usersJson != null) {
      users = List<Map>.from(json.decode(usersJson) as List)
          .map((jsonMap) => User.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
    } else {
      users = <User>[];
    }
    return users;
  }

  void _init() {
    final usersJson = _getValue(kUserCollectionKey);
    if (usersJson != null) {
      final users = List<Map>.from(json.decode(usersJson) as List)
          .map((jsonMap) => User.fromJson(Map<String, dynamic>.from(jsonMap)))
          .toList();
      final currentUserId = _getValue(kCurrentUserIdKey);
      if (currentUserId != null) {
        final currentUser = users.firstWhere(
          (element) => element.id == currentUserId,
          orElse: User.guest,
        );
        _userStreamController.add(currentUser);
      }
    }
  }

  Future<void> _save({
    required List<User> users,
    required String currentUserId,
  }) async {
    await _setValue(kUserCollectionKey, json.encode(users)); //update users list
    await _setValue(kCurrentUserIdKey, currentUserId);
    //_userStreamController.add(user); //TODO: maybe need
  }

  @override
  Future<void> addUser(User user) async {
    final users = _users()..add(user);
    await _save(currentUserId: user.id, users: users);
  }

  @override
  Future<void> deleteUser(User user) async {
    final users = _users()..remove(user);
    await _save(currentUserId: '', users: users);
  }

  @override
  Stream<User> getUser({required String userId}) {
    return _userStreamController.asBroadcastStream();
  }

  @override
  Future<void> updateUser(User user) async {
    final users = _users()
      ..removeWhere((element) => element.id == user.id)
      ..add(user);
    await _save(currentUserId: user.id, users: users);
  }
}

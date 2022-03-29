import 'package:flutter/foundation.dart';
import 'package:flutter_timerman/src/core/util/cache.dart';
import 'package:flutter_timerman/src/features/auth/domain/models/models.dart';

abstract class AuthRepository {
  AuthRepository({CacheClient? cache}) : _cache = cache ?? CacheClient();

  final CacheClient _cache;
  bool isWeb = kIsWeb;

  CacheClient get cache => _cache;
  Stream<User> get user;
  User get currentUser;

  Future<void> signUp({required String email, required String password});
  Future<void> logInWithGoogle();
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
  // TODO: add more auth
  Future<void> logOut();
}

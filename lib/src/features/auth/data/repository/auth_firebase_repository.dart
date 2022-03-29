import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_timerman/src/features/auth/domain/models/models.dart'
    show User;
import 'package:flutter_timerman/src/features/auth/domain/repository/auth_repository.dart'
    show AuthRepository;
import 'package:google_sign_in/google_sign_in.dart';

// ignore: always_use_package_imports
import 'auth_firebase_exception.dart'
    show
        LogInWithEmailAndPasswordFailure,
        LogInWithGoogleFailure,
        LogOutFailure,
        SignUpWithEmailAndPasswordFailure;

class AuthFirebaseRepository extends AuthRepository {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.standard();
  final _facebookAuth = FacebookAuth.instance;

  static const userCacheKey = '__user_cache_key__';

  @override
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map(
      (firebaseUser) {
        final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
        cache.write(key: userCacheKey, value: user);
        return user;
      },
    );
  }

  @override
  User get currentUser {
    return cache.read(key: userCacheKey) ?? User.empty;
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential =
            await _firebaseAuth.signInWithPopup(googleProvider);
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _facebookAuth.logOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}

import 'package:flutter_timerman/src/core/services/firestore_service.dart';
import 'package:flutter_timerman/src/features/app/domain/repository/user_access_repository.dart';

class FirebaseUserAccessRepository implements UserAccessRepository {
  final _service = FirestoreService.instance;

  Future<bool> existDocument(String path) async {
    final snapshot = await _service.documentReference(path).get();
    return snapshot.exists;
  }

  @override
  Future<bool> isAdministrator({required String userId}) async {
    return existDocument('administrators/$userId');
  }

  @override
  Future<bool> isModerator({required String userId}) {
    return existDocument('moderators/$userId');
  }
}

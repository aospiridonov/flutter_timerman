abstract class UserAccessRepository {
  Future<bool> isModerator({required String userId});
  Future<bool> isAdministrator({required String userId});
}

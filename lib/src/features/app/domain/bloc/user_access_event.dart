part of 'user_access_bloc.dart';

@freezed
class UserAccessEvent with _$UserAccessEvent {
  const factory UserAccessEvent.get({required String userId}) =
      UserAccessEventGet;
}

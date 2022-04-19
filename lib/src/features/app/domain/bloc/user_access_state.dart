part of 'user_access_bloc.dart';

@freezed
class UserAccessState with _$UserAccessState {
  const factory UserAccessState.status({required UserAccess access}) =
      UserAccessStateStatus;
}

part of 'user_profile_bloc.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.undefined() = UserProfileStateUndefined;

  const factory UserProfileState.origin({required User user}) =
      UserProfileStateOrigin;

  const factory UserProfileState.modified({required User user}) =
      UserProfileStateModified;

  factory UserProfileState.fromJson(Map<String, dynamic> json) =>
      _$UserProfileStateFromJson(json);
}

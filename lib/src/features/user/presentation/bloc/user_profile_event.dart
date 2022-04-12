part of 'user_profile_bloc.dart';

@freezed
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.init({required User user}) =
      UserProfileEventInit;
  const factory UserProfileEvent.update({required User user}) =
      UserProfileEventUpdate;
}

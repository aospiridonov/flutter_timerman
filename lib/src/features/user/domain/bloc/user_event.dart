part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.get({required String userId}) = UserEventGet;
  const factory UserEvent.save({required User user}) = UserEventSave;
}

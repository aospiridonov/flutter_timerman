import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/user/domain/models/models.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_bloc.freezed.dart';
part 'user_profile_bloc.g.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(const UserProfileState.undefined()) {
    on<UserProfileEventInit>(_onInit);
    on<UserProfileEventUpdate>(_onUpdate);
  }

  User _user = User.guest();

  Future<void> _onInit(
    UserProfileEventInit event,
    Emitter<UserProfileState> emit,
  ) async {
    _user = event.user;
    emit(UserProfileState.origin(user: event.user));
  }

  Future<void> _onUpdate(
    UserProfileEventUpdate event,
    Emitter<UserProfileState> emit,
  ) async {
    //
    if (_user == event.user) {
      emit(UserProfileState.origin(user: event.user));
    } else {
      emit(UserProfileState.modified(user: event.user));
    }
  }

  //TODO: refactoring
  UserProfileState? fromJson(Map<String, dynamic> json) =>
      UserProfileState.fromJson(json);

  //TODO: refactoring
  Map<String, dynamic>? toJson(UserProfileState state) => state.toJson();
}

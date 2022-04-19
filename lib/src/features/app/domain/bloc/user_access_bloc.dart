import 'package:bloc/bloc.dart';
import 'package:flutter_timerman/src/features/app/data/repository/firebase_user_access_repository.dart';
import 'package:flutter_timerman/src/features/app/domain/models/user_access.dart';
import 'package:flutter_timerman/src/features/app/domain/repository/user_access_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_access_event.dart';
part 'user_access_state.dart';

part 'user_access_bloc.freezed.dart';

class UserAccessBloc extends Bloc<UserAccessEvent, UserAccessState> {
  UserAccessBloc()
      : super(const UserAccessStateStatus(access: UserAccess.undefined)) {
    on<UserAccessEventGet>(_onGetUserAccess);
  }

  final UserAccessRepository _repository = FirebaseUserAccessRepository();

  Future<void> _onGetUserAccess(UserAccessEventGet event, Emitter emit) async {
    //repository
    final isAdmin = await _repository.isAdministrator(userId: event.userId);
    if (isAdmin) {
      emit(const UserAccessStateStatus(access: UserAccess.administrator));
      return;
    }
    final isModerator = await _repository.isModerator(userId: event.userId);
    if (isModerator) {
      emit(const UserAccessStateStatus(access: UserAccess.moderator));
      return;
    }
    emit(const UserAccessStateStatus(access: UserAccess.undefined));
  }
}

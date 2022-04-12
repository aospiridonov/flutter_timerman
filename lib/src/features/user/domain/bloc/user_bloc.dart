import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/user/domain/models/models.dart';
import 'package:flutter_timerman/src/features/user/domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';
part 'user_bloc.g.dart';

part 'user_event.dart';
part 'user_state.dart';

//TODO: add lisener for change user stream

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository repository})
      : _repository = repository,
        super(const UserState.loading()) {
    on<UserEventGet>(_onGetUser);
    on<UserEventSave>(_onSaveUser);
  }

  final UserRepository _repository;

  Future<void> _onGetUser(
    UserEventGet event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    try {
      await emit.forEach<User>(
        _repository.getUser(userId: event.userId),
        onData: (user) {
          return UserState.loaded(user: user);
        },
      );
    } catch (__) {
      emit(const UserState.error());
      rethrow;
    }
  }

  Future<void> _onSaveUser(
    UserEventSave event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    try {
      await _repository.updateUser(event.user);
      //
    } catch (__) {
      emit(const UserState.error());
      rethrow;
    }

    //
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) => UserState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(UserState state) => state.toJson();
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timerman/src/features/user/domain/models/models.dart';
import 'package:flutter_timerman/src/features/user/domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';
part 'user_bloc.g.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required UserRepository repository})
      : _repository = repository,
        super(const UserState.loading()) {
    on<UserEventGetUser>(_onGetUser);
  }

  final UserRepository _repository;

  Future<void> _onGetUser(
    UserEventGetUser event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserState.loading());
    try {
      _repository.getUser(userId: event.userId);
      emit(UserState.loaded(user: User.guest()));
    } catch (__) {
      emit(const UserState.error());
      rethrow;
    }
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) => UserState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(UserState state) => state.toJson();
}

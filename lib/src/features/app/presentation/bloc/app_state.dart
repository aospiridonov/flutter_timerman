part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

enum AppUserType {
  defaulted,
  moderator,
  administrator,
  deleted,
  banned,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
    this.userType = AppUserType.defaulted,
  });

  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;
  final AppUserType userType;

  @override
  List<Object?> get props => [status, user];
}

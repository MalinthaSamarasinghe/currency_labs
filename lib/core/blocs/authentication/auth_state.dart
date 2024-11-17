part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  sessionExpired,
  accountDeleted,
}

class AuthState extends Equatable {
  final AuthStatus authenticationStatus;
  final UserEntity? user;

  const AuthState({
    this.authenticationStatus = AuthStatus.unauthenticated,
    this.user,
  });

  @override
  List<Object?> get props => [authenticationStatus, user];

  AuthState copyWith({
    AuthStatus? authenticationStatus,
    UserEntity? user,
  }) {
    return AuthState(
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
      user: user ?? this.user,
    );
  }
}

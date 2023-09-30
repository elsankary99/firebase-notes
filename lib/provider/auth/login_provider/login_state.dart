abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginDataFetched extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
}

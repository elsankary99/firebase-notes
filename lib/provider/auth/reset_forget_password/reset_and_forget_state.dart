part of 'reset_and_forget_provider.dart';

abstract class ResetAndForgetState {
  const ResetAndForgetState();
}

class ResetAndForgetInitial extends ResetAndForgetState {}

//? Reset Password
class ResetPasswordLoading extends ResetAndForgetState {}

class ResetPasswordSuccess extends ResetAndForgetState {}

class ResetPasswordError extends ResetAndForgetState {
  final String message;
  const ResetPasswordError(this.message);
}

//? Forget Password
class ForgetPasswordLoading extends ResetAndForgetState {}

class ForgetPasswordSuccess extends ResetAndForgetState {}

class ForgetPasswordError extends ResetAndForgetState {
  final String message;
  const ForgetPasswordError(this.message);
}

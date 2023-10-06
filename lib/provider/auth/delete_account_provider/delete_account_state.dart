part of 'delete_account_provider.dart';

abstract class DeleteAccountState {
  const DeleteAccountState();
}

//? Delete Account
class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountSuccess extends DeleteAccountState {}

class DeleteAccountError extends DeleteAccountState {
  final String message;
  const DeleteAccountError(this.message);
}

//? log out
class LogOutLoading extends DeleteAccountState {}

class LogOutSuccess extends DeleteAccountState {}

class LogOutError extends DeleteAccountState {
  final String message;
  const LogOutError(this.message);
}

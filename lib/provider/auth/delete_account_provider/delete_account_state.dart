part of 'delete_account_provider.dart';

abstract class DeleteAccountState {
  const DeleteAccountState();
}

class DeleteAccountInitial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountSuccess extends DeleteAccountState {}

class DeleteAccountError extends DeleteAccountState {
  final String message;
  const DeleteAccountError(this.message);
}

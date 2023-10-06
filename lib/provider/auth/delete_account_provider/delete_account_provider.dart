import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'delete_account_state.dart';

final deleteAccountProvider =
    StateNotifierProvider<DeleteAccountProvider, DeleteAccountState>(
        (ref) => DeleteAccountProvider());

class DeleteAccountProvider extends StateNotifier<DeleteAccountState> {
  DeleteAccountProvider() : super(DeleteAccountInitial());

  Future<void> deleteAccount() async {
    state = DeleteAccountLoading();
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      state = DeleteAccountSuccess();
      log('DeleteAccountSuccess.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        state = const DeleteAccountError(
            'The user must reauthenticate before this operation can be executed.');

        log('The user must reauthenticate before this operation can be executed.');
      } else {
        state = DeleteAccountError(e.toString());
      }
    } catch (e) {
      log(e.toString());

      state = DeleteAccountError(e.toString());
    }
  }
}

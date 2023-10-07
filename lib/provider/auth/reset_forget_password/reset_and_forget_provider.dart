import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'reset_and_forget_state.dart';

final resetAndForgetProvider =
    StateNotifierProvider<ResetAndForgetProvider, ResetAndForgetState>(
        (ref) => ResetAndForgetProvider());

class ResetAndForgetProvider extends StateNotifier<ResetAndForgetState> {
  ResetAndForgetProvider() : super(ResetAndForgetInitial());

  String? email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> forgetPassword() async {
    state = ForgetPasswordLoading();
    log("ResetPasswordLoading");
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
        log("ResetPasswordSuccess");

        state = ForgetPasswordSuccess();
      } catch (e) {
        log(e.toString());

        state = ForgetPasswordError(e.toString());
      }
    }
  }
}

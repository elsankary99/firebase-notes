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
  String? password;
  String? email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
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

  Future<void> resetPassword() async {
    state = ResetPasswordLoading();
    log("ResetPasswordLoading");
    if (formKey1.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.currentUser!.updatePassword(password!);
        log("ResetPasswordSuccess");

        state = ResetPasswordSuccess();
      } catch (e) {
        log(e.toString());

        state = ResetPasswordError(e.toString());
      }
    }
  }
}

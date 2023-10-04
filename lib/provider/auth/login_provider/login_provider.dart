import 'dart:developer';

import 'package:fb_note/provider/auth/login_provider/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginProvider, LoginState>(
        (ref) => LoginProvider());

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginInitial());
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  login() async {
    if (formKey.currentState!.validate()) {
      try {
        log('======Loading===132===');
        state = LoginLoading();
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
        state = LoginSuccess();
        log('======Success======');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          state = const LoginError("No user found for that email.");
          log('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          state = const LoginError("Wrong password provided for that user.");

          log('Wrong password provided for that user.');
        } else {
          state = const LoginError(
              "Some thing went Wrong with your email or password.");
        }
      }
    }
  }
}

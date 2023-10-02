import 'dart:developer';

import 'package:fb_note/provider/auth/sidnup_provider/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpProvider, SignUpState>(
        (ref) => SignUpProvider());

class SignUpProvider extends StateNotifier<SignUpState> {
  SignUpProvider() : super(SignUpInitial());
  bool isSelected = false;
  String? userName;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      log("+===============$SignUpLoading================+");
      state = SignUpLoading();

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        state = SignUpSuccess();
        log("+===============$SignUpSuccess================+");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          log("The password provided is too weak.");

          state = const SignUpError("The password provided is too weak.");
        } else if (e.code == 'email-already-in-use') {
          log("The account already exists for that email.");

          state =
              const SignUpError("The account already exists for that email.");
        }
      } catch (e) {
        log("+===============${e.toString()}================+");

        state = SignUpError(e.toString());
      }
    }
  }

  void checkBoxChanged(bool value) {
    isSelected = value;
    state = TermsAndConditionState();
  }
}

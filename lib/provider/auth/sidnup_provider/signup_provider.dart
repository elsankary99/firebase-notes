import 'dart:developer';

import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/provider/auth/sidnup_provider/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider = StateNotifierProvider<SignUpProvider, SignUpState>(
    (ref) => SignUpProvider());

class SignUpProvider extends StateNotifier<SignUpState> {
  SignUpProvider() : super(SignUpInitial());
  bool isSelected = false;
  String? email;
  String? password;
  String? userName;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  signUp() {
    if (formKey.currentState!.validate()) {
      log("========================");
      router.replace(const HomeRoute());
    }
  }

  void checkBoxChanged(bool value) {
    isSelected = value;
    state = TermsAndConditionState();
  }
}

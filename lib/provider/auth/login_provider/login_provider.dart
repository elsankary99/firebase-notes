import 'dart:developer';

import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/provider/auth/login_provider/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider =
    StateNotifierProvider<LoginProvider, LoginState>((ref) => LoginProvider());

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginInitial());
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  login() {
    if (formKey.currentState!.validate()) {
      log("========================");
      router.replace(const HomeRoute());
    }
  }
}

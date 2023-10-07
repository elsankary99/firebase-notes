import 'dart:developer';

import 'package:fb_note/core/function/auth_state_changes.dart';
import 'package:fb_note/firebase_options.dart';
import 'package:fb_note/provider/home_provider/change_theme_provider/change_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Override>> boot() async {
  log("=====Boot===");

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  authStateChanges();
  final overrides = <Override>[
    sharedPrefProvider.overrideWithValue(await SharedPreferences.getInstance())
  ];
  return overrides;
}

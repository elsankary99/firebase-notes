import 'package:fb_note/app.dart';
import 'package:fb_note/core/function/auth_state_changes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  authStateChanges();
  runApp(const ProviderScope(child: MyApp()));
}

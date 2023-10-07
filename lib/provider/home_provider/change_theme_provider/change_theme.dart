import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  log("sharedPrefProvider");
  throw UnimplementedError();
});
final changeThemeProvider = ChangeNotifierProvider<ChangeTheme>((ref) {
  return ChangeTheme(prefs: ref.read(sharedPrefProvider));
});

class ChangeTheme extends ChangeNotifier {
  final SharedPreferences prefs;

  ChangeTheme({required this.prefs}) {
    boot();
  }
  bool? isDark;
  Future<void> boot() async {
    bool savedTheme = getSavedTheme();
    isDark = savedTheme;
    notifyListeners();
    log("=====boot==$isDark=========");
  }

  Future<void> changeTheme(bool isDark) async {
    await prefs.setBool("isDark", isDark);
    this.isDark = isDark;
    notifyListeners();
    log("====isDark====$isDark======");
  }

  bool getSavedTheme() => prefs.getBool("isDark") ?? false;
}

import 'package:fb_note/app.dart';
import 'package:fb_note/boot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  final overrides = await boot();

  runApp(
    ProviderScope(
      overrides: overrides,
      child: const MyApp(),
    ),
  );
}

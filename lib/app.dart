import 'dart:developer';

import 'package:fb_note/core/theme/app_theme.dart';
import 'package:fb_note/provider/home_provider/change_theme_provider/change_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(changeThemeProvider);
    log("+++++++++++++++++++++++++++++++++");
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp.router(
            theme: getAppTheme(context, theme.isDark ?? false),
            debugShowCheckedModeBanner: false,
            routerConfig: router.config(),
          );
        });
  }
}

import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp.router(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.orange)),
              scaffoldBackgroundColor: AppColors.lightGrey,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: router.config(),
          );
        });
  }
}

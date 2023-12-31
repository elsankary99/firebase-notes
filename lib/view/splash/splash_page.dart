import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_colors.dart';
import 'package:fb_note/core/constant/app_images.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified) {
          return context.router.replace(const HomeRoute());
        }
        return context.router.replace(const OnBoardingRoute());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Image.asset(Assets.assetsImagesSplashLogo),
      ),
    );
  }
}

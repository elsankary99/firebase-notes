import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.envelopeOpen,
              size: 80.sp,
            ),
            SizedBox(height: context.height * 0.07),
            Text(
              AppStrings.verifyYourEmailAddress,
              textAlign: TextAlign.center,
              style: AppTextStyle.lato700Style18,
            ),
            SizedBox(height: context.height * 0.02),
            Text(
              AppStrings.verifyYourEmailAddress2,
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.lato400Style18.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: context.height * 0.02),
            Text(
              AppStrings.verifyYourEmailAddress3,
              textAlign: TextAlign.center,
              style:
                  AppTextStyle.lato400Style18.copyWith(color: AppColors.grey),
            ),
            SizedBox(height: context.height * 0.05),
            SizedBox(
              height: context.height * 0.055,
              width: context.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  if (FirebaseAuth.instance.currentUser!.emailVerified) {
                    context.router.replace(const HomeRoute());
                  } else {
                    customToast(
                        title: "You Must Verify your Email First",
                        color: Colors.red);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: AppColors.black))),
                child: Text(
                  AppStrings.kContinue,
                  style: AppTextStyle.lato300Style18,
                ),
              ),
            ),
            SizedBox(height: context.height * 0.01),
            TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.currentUser!
                      .sendEmailVerification();
                },
                child: const Text(
                  "Resend E-Mail Link",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            TextButton.icon(
                onPressed: () {
                  context.router.replace(const LoginRoute());
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  "back to login",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}

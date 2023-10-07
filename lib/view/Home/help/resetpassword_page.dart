import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/reset_forget_password/reset_and_forget_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(resetAndForgetProvider.notifier);
    final state = ref.watch(resetAndForgetProvider);
    ref.listen(
      resetAndForgetProvider,
      (previous, next) {
        if (next is ResetPasswordSuccess) {
          customToast(title: "The link has been sent successfully");
        }
        if (next is ResetPasswordLoading) {
          context.router.pop();
        }
        if (next is ResetPasswordError) {
          customToast(title: next.message, color: Colors.red);
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              color: AppColors.orange,
              size: 100.sp,
            ),
            SizedBox(height: context.height * 0.1),
            Text(
              "Reset Your Password",
              textAlign: TextAlign.center,
              style: AppTextStyle.lato400Style24,
            ),
            SizedBox(height: context.height * 0.02),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style:
                        AppTextStyle.lato500Style14.copyWith(fontSize: 18.sp),
                    children: [
                      const TextSpan(text: "We'll send a link for \n"),
                      TextSpan(
                          text: FirebaseAuth.instance.currentUser!.email,
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.orange)),
                      const TextSpan(text: "\nto reset your password ."),
                    ])),
            SizedBox(height: context.height * 0.1),
            SizedBox(
              width: double.infinity,
              height: context.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  showMyDialog(context,
                      btnTitle: "Submit",
                      header: "Reset Password",
                      title:
                          "We'll send a link for your email to reset your password",
                      onPressed: () async {
                    // await provider.resetPassword();
                  });
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColors.orange),
                child: state is ResetPasswordLoading
                    ? const CustomCircleIndicator()
                    : Text(
                        "Reset Password",
                        style: AppTextStyle.lato700Style14
                            .copyWith(color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

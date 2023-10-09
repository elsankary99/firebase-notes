import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/reset_forget_password/reset_and_forget_provider.dart';
import 'package:fb_note/view/widget/home_widget/custom_reset_pass_field.dart';
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
          customToast(title: "Password Reset successfully");
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: provider.formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.orange,
                size: 50.sp,
              ),
              SizedBox(height: context.height * 0.02),
              Text(
                "Reset Your Password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: context.height * 0.05),
              CustomResetPasswordField(
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please Enter New Password";
                    } else if (value.trim().length < 6) {
                      return "Password must be at least 6 characters long";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (password) {
                    provider.password = password;
                  },
                  hint: "Enter new password"),
              SizedBox(height: context.height * 0.03),
              CustomResetPasswordField(
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return "Please Re-Enter New Password";
                    } else if (value.trim().length < 6) {
                      return "Password must be at least 6 characters long";
                    } else if (value != provider.password) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  },
                  hint: "Re enter new password"),
              SizedBox(height: context.height * 0.1),
              SizedBox(
                width: double.infinity,
                height: context.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    if (provider.formKey1.currentState!.validate()) {
                      showMyDialog(context,
                          btnTitle: "Submit",
                          header: "Reset Password",
                          title:
                              "We'll send a link for your email to reset your password",
                          onPressed: () async {
                        await provider.resetPassword();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange),
                  child: state is ResetPasswordLoading
                      ? const CustomCircleIndicator()
                      : Text(
                          "Reset Password",
                          style: AppTextStyle.lato700Style14
                              .copyWith(color: Theme.of(context).canvasColor),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

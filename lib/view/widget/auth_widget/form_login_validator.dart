import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/login_provider/login_provider.dart';
import 'package:fb_note/provider/auth/login_provider/login_state.dart';
import 'package:fb_note/view/widget/auth_widget/custom_password_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/forget_password_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormLoginValidator extends ConsumerWidget {
  const FormLoginValidator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);

    ref.listen(loginProvider, (previous, currentState) async {
      if (currentState is LoginError) {
        log("+==================v500=============+");

        customToast(
          title: currentState.message,
          color: Colors.red,
        );
      }
      if (currentState is LoginSuccess) {
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          context.router.replace(const HomeRoute());
          customToast(title: AppStrings.welcomeLBack);
        } else {
          context.router.replace(const VerifyEmailRoute());
          try {
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          } on Exception catch (e) {
            log("=====${e.toString()}====");
          }
          log("=====Send====");
          customToast(title: "We sent a verification message to your email");
        }
      }
    });
    return Form(
        key: provider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
                onChanged: (email) {
                  provider.email = email.trim();
                },
                hint: AppStrings.emailAddress,
                icon: FontAwesomeIcons.envelope),
            SizedBox(height: context.height * 0.03),
            CustomPasswordFormField(
              onChanged: (password) {
                provider.password = password.trim();
              },
            ),
            SizedBox(height: context.height * 0.02),
            const CustomForgetPassText(),
            SizedBox(height: context.height * 0.15),
            CustomOrangeButton(
                onPressed: () async {
                  await provider.login();
                },
                text: AppStrings.login,
                child: state is LoginLoading
                    ? const CustomCircleIndicator()
                    : null),
          ],
        ));
  }
}

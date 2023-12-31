import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/sidnup_provider/signup_provider.dart';
import 'package:fb_note/provider/auth/sidnup_provider/signup_state.dart';
import 'package:fb_note/view/widget/auth_widget/custom_password_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/termis_condition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormSignUpValidator extends ConsumerWidget {
  const FormSignUpValidator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(signUpProvider.notifier);
    final state = ref.watch(signUpProvider);
    ref.listen(signUpProvider, (previous, currentState) {
      if (currentState is SignUpError) {
        log("+==================vv2=============+");
        customToast(
          title: currentState.message,
          color: Colors.red,
        );
      }
      if (currentState is SignUpSuccess) {
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          context.router.replace(const HomeRoute());
          customToast(title: AppStrings.welcomeToOurApp);
        } else {
          context.router.replace(const VerifyEmailRoute());
          customToast(title: "We sent a verification message to your email");
        }
      }
    });
    return Form(
        key: provider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
                onChanged: (userName) {
                  provider.userName = userName;
                },
                hint: AppStrings.userName,
                icon: FontAwesomeIcons.user),
            SizedBox(height: context.height * 0.03),
            CustomTextFormField(
                onChanged: (email) {
                  provider.email = email;
                },
                hint: AppStrings.emailAddress,
                icon: FontAwesomeIcons.envelope),
            SizedBox(height: context.height * 0.03),
            CustomPasswordFormField(
              onChanged: (password) {
                provider.password = password;
              },
            ),
            const TermsAndConditionWidget(),
            SizedBox(height: context.height * 0.12),
            Consumer(
              builder: (context, ref, child) {
                ref.watch(signUpProvider);
                return SizedBox(
                    width: double.infinity,
                    child: CustomOrangeButton(
                        onPressed: provider.isSelected
                            ? () {
                                provider.signUp();
                              }
                            : null,
                        text: AppStrings.signUP,
                        child: state is SignUpLoading
                            ? const CustomCircleIndicator()
                            : null));
              },
            ),
          ],
        ));
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/auth_widget/custom_password_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/dont_have_account.dart';
import 'package:fb_note/view/widget/auth_widget/forget_password_text.dart';
import 'package:fb_note/view/widget/auth_widget/welcome_text.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              AppStrings.login,
              style: AppTextStyle.lato300Style18,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(child: WelcomeText()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(child: CustomTextFormField()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: CustomPasswordFormField()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          const SliverToBoxAdapter(child: CustomForgetPassText()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.15)),
          SliverToBoxAdapter(
              child:
                  CustomOrangeButton(onPressed: () {}, text: AppStrings.login)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          const SliverToBoxAdapter(child: DontHaveAccount()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        ]),
      ),
    );
  }
}

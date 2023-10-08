import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/view/widget/auth_widget/dont_have_account.dart';
import 'package:fb_note/view/widget/auth_widget/form_login_validator.dart';
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
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(
              child: WelcomeText(
            title1: AppStrings.welcomeBack,
            title2: AppStrings.pleaseLoginWithEmail,
          )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(child: FormLoginValidator()),
          //?
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          const SliverToBoxAdapter(child: DontHaveAccount()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        ]),
      ),
    );
  }
}

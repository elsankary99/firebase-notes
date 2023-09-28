import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/core/widget/custom_white_buton.dart';
import 'package:fb_note/view/widget/onboarding_widget/onboarding_body.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.2)),
            const SliverToBoxAdapter(child: OnBoardingBody()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.035)),
            SliverToBoxAdapter(
                child: CustomOrangeButton(
                    text: AppStrings.createAccount,
                    onPressed: () =>
                        context.router.replace(const SignUpRoute()))),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.025)),
            SliverToBoxAdapter(
                child: CustomWhiteButton(
                    text: AppStrings.login,
                    onPressed: () =>
                        context.router.replace(const LoginRoute()))),
          ],
        ),
      ),
    );
  }
}

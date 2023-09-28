import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/auth_widget/allred_have_account.dart';
import 'package:fb_note/view/widget/auth_widget/custom_password_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              AppStrings.createAccount,
              style: AppTextStyle.lato300Style18,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.05)),
          const SliverToBoxAdapter(
              child: WelcomeText(
            title1: AppStrings.letKnowYou,
            title2: AppStrings.enterYourDetails,
          )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(
              child: CustomTextFormField(
                  hint: AppStrings.userName, icon: FontAwesomeIcons.user)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(
              child: CustomTextFormField(
                  hint: AppStrings.emailAddress,
                  icon: FontAwesomeIcons.envelope)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          const SliverToBoxAdapter(child: CustomPasswordFormField()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.15)),
          SliverToBoxAdapter(
              child: CustomOrangeButton(
                  onPressed: () {}, text: AppStrings.signUP)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          const SliverToBoxAdapter(child: AlreadyHaveAccount()),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        ]),
      ),
    );
  }
}

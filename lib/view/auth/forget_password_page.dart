import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
              color: AppColors.orange,
            )),
        centerTitle: true,
        title: Text(
          AppStrings.forgot_pwd,
          style: AppTextStyle.lato300Style18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          SliverToBoxAdapter(
            child: Text(AppStrings.pleaseEnterYourAccount,
                style: AppTextStyle.lato300Style18),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          const SliverToBoxAdapter(
              child: CustomTextFormField(
                  hint: AppStrings.emailAddress,
                  icon: FontAwesomeIcons.envelope)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.35)),
          SliverToBoxAdapter(
              child: CustomOrangeButton(
                  onPressed: () {}, text: AppStrings.submit.toUpperCase())),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        ]),
      ),
    );
  }
}

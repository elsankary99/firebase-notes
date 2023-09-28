import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          SliverToBoxAdapter(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: AppStrings.emailAddress,
                prefixIcon: const Icon(FontAwesomeIcons.envelope),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          )),
          SliverToBoxAdapter(
              child: TextFormField(
            cursorColor: AppColors.orange,
            decoration: InputDecoration(
                prefixIconColor: AppColors.orange,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: AppColors.orange, width: 1.5)),
                hintText: AppStrings.emailAddress,
                prefixIcon: const Icon(Icons.lock),
                border:
                    OutlineInputBorder( )),
          )),
        ]),
      ),
    );
  }
}

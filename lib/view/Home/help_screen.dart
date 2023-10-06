import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/view/widget/home_widget/help_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpScreen extends ConsumerWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: AppColors.orange,
          expandedHeight: context.height * 0.3,
          flexibleSpace: Center(
            child: Text(AppStrings.help, style: AppTextStyle.lato700Style40),
          ),
        ),
        SliverToBoxAdapter(
            child: HelpBodyWidget(
          title: AppStrings.deleteAccount,
          icon: FontAwesomeIcons.trashCan,
          onTap: () {
            context.router.push(const DeleteAccountRoute());
          },
        )),
        SliverToBoxAdapter(
            child: HelpBodyWidget(
          title: AppStrings.reset_pwd,
          icon: Icons.lock,
          onTap: () {
            context.router.push(const ResetPasswordRoute());
          },
        )),
      ],
    );
  }
}

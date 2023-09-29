import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/home_widget/custom_appbar.dart';
import 'package:fb_note/view/widget/home_widget/user_information.dart';
import 'package:fb_note/view/widget/home_widget/user_screen_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        customAppBar,
        const SliverToBoxAdapter(child: UserInformation()),
        const SliverToBoxAdapter(child: Divider(thickness: 2)),
        const SliverToBoxAdapter(child: UserScreenSetting()),
        SliverToBoxAdapter(
            child: SizedBox(
          height: context.height * 0.2,
        )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomOrangeButton(text: AppStrings.log_out, onPressed: () {}),
        ))
      ],
    );
  }
}

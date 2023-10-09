import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/delete_account_provider/delete_account_provider.dart';
import 'package:fb_note/view/widget/home_widget/custom_appbar.dart';
import 'package:fb_note/view/widget/home_widget/user_information.dart';
import 'package:fb_note/view/widget/home_widget/user_screen_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(deleteAccountProvider.notifier);
    final state = ref.watch(deleteAccountProvider);
    ref.listen(
      deleteAccountProvider,
      (previous, next) {
        if (next is LogOutLoading) {
          context.router.pop();
        }
        if (next is LogOutSuccess) {
          router.replace(const LoginRoute());
          customToast(title: "SignOut Success");
        }
        if (next is LogOutError) {
          customToast(title: next.message, color: Colors.red);
        }
      },
    );
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        customAppBar,
        const SliverToBoxAdapter(child: UserInformation()),
        const SliverToBoxAdapter(child: Divider(thickness: 2)),
        const SliverToBoxAdapter(child: UserScreenSetting()),
        SliverToBoxAdapter(
            child: SizedBox(
          height: context.height * 0.3,
        )),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomOrangeButton(
              text: AppStrings.logOut,
              onPressed: () {
                showMyDialog(context, onPressed: () async {
                  await provider.logOut();
                },
                    header: AppStrings.logOut,
                    btnTitle: AppStrings.logOut,
                    title: AppStrings.sureLogOut);
              },
              child: state is LogOutLoading
                  ? const CustomCircleIndicator()
                  : null),
        ))
      ],
    );
  }
}

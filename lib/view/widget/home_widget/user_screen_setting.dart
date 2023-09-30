import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreenSetting extends StatelessWidget {
  const UserScreenSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        onTap: () {},
        leading: const Icon(FontAwesomeIcons.solidMoon),
        title: const Text(AppStrings.dark_mode),
        trailing: Switch(
          value: false,
          activeColor: AppColors.orange,
          onChanged: (value) {},
        ),
      ),
      ListTile(
        onTap: () {},
        leading: const Icon(Icons.lock),
        title: const Text(AppStrings.reset_pwd),
      ),
      ListTile(
        onTap: () => context.router.push(const AboutRoute()),
        leading: const Icon(FontAwesomeIcons.circleInfo),
        title: const Text(AppStrings.about),
      ),
    ]);
  }
}

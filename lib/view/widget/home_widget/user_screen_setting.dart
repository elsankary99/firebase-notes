import 'package:fb_note/provider/home_provider/change_theme_provider/change_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserScreenSetting extends ConsumerWidget {
  const UserScreenSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(changeThemeProvider);
    final provider = ref.read(changeThemeProvider);
    return Column(children: [
      ListTile(
        onTap: () {},
        leading: const Icon(FontAwesomeIcons.solidMoon),
        title: const Text(AppStrings.darkMode),
        trailing: Switch(
          value: provider.isDark ?? false,
          activeColor: AppColors.orange,
          onChanged: (isDark) async {
            await provider.changeTheme(isDark);
          },
        ),
      ),
      ListTile(
        onTap: () => context.router.push(const AboutRoute()),
        leading: const Icon(FontAwesomeIcons.circleInfo),
        title: const Text(AppStrings.about),
      ),
    ]);
  }
}

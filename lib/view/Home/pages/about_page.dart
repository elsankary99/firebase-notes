import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_images.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(
                FontAwesomeIcons.chevronLeft,
                color: Colors.white,
              )),
          backgroundColor: AppColors.orange,
          expandedHeight: context.height * 0.3,
          flexibleSpace: Center(
            child: Image.asset(Assets.assetsImagesAboutNoteLogo),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(children: [
            ListTile(
                leading: Text(
                  "Application Name",
                  style: AppTextStyle.lato400Style18,
                ),
                trailing: Text(
                  "Note App",
                  style: AppTextStyle.lato400Style18,
                )),
            ListTile(
                leading: Text(
                  "Version",
                  style: AppTextStyle.lato400Style18,
                ),
                trailing: Text(
                  "V 1.0.0",
                  style: AppTextStyle.lato400Style18,
                )),
          ]),
        )
      ]),
    );
  }
}

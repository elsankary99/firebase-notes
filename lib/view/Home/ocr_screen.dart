import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/home_widget/clear_iamge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OCRScreen extends ConsumerWidget {
  const OCRScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            AppStrings.ocrScreen,
            style: AppTextStyle.lato500Style34,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  height: context.height * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.orange, width: 2)),
                ),
                SizedBox(height: context.height * 0.02),
                Container(
                  height: context.height * 0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.orange, width: 2)),
                ),
                SizedBox(height: context.height * 0.05),
                SizedBox(
                    height: context.height * 0.05,
                    child: Row(
                      children: [
                        ClearImageButton(onPressed: () {}),
                        SizedBox(width: context.width * 0.05),
                        CustomOrangeButton(
                          text: AppStrings.scanImage,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

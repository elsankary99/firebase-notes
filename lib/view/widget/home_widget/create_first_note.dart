import 'package:fb_note/core/constant/app_images.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';

class CreateYourFirstNoteWidget extends StatelessWidget {
  const CreateYourFirstNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          height: context.height * 0.3,
          Assets.assetsImagesEmptyNote,
          fit: BoxFit.fill,
        ),
        SizedBox(height: context.height * 0.03),
        Text(
          AppStrings.home_empty_note,
          style: AppTextStyle.lato300Style18,
        )
      ],
    );
  }
}

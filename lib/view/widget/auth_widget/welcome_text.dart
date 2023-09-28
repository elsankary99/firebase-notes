import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack,
          style: AppTextStyle.lato700Style18,
        ),
        SizedBox(height: context.height * 0.01),
        Text(AppStrings.pleaseLoginWithEmail,
            style: AppTextStyle.lato300Style18),
      ],
    );
  }
}

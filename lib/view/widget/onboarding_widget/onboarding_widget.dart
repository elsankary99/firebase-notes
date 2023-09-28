import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingModel data;
  const OnboardingWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: context.height * 0.01),
        Image.asset(data.image),
        SizedBox(height: context.height * 0.01),
        Text(
          data.title1,
          style: AppTextStyle.lato500Style24,
        ),
        Text(
          data.title2,
          style: AppTextStyle.lato400Style18,
        ),
      ],
    );
  }
}

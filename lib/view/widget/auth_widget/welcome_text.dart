import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String title1;
  final String title2;
  const WelcomeText({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style: AppTextStyle.lato700Style18,
        ),
        SizedBox(height: context.height * 0.01),
        Text(title2, style: AppTextStyle.lato300Style18),
      ],
    );
  }
}

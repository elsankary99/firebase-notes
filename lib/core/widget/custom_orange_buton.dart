import 'package:fb_note/core/constant/app-colors.dart';

import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';

class CustomOrangeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const CustomOrangeButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.058,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        child: Text(
          text,
          style: AppTextStyle.lato400Style14,
        ),
      ),
    );
  }
}

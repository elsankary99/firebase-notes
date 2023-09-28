import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppStrings.dntHaveAccount, style: AppTextStyle.lato300Style18),
        InkWell(
          onTap: () {},
          child: Text(AppStrings.signUP,
              style: AppTextStyle.lato700Style14
                  .copyWith(color: AppColors.orange)),
        ),
      ],
    );
  }
}

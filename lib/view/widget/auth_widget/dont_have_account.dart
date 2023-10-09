import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/router/app_router.dart';
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
        Text(AppStrings.dntHaveAccount,
            style: Theme.of(context).textTheme.titleSmall),
        InkWell(
          onTap: () {
            context.router.replace(const SignUpRoute());
          },
          child: Text(AppStrings.signUP,
              style: AppTextStyle.lato700Style14
                  .copyWith(color: AppColors.orange)),
        ),
      ],
    );
  }
}

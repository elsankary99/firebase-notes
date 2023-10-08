import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:flutter/material.dart';

class CustomForgetPassText extends StatelessWidget {
  const CustomForgetPassText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.router.push(const ForgetPasswordRoute()),
        child: Text(
          AppStrings.forgotPassword,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

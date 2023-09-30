import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/view/widget/auth_widget/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomCheckBox(),
        Text(
          AppStrings.iHaveAgreeToOur,
          textAlign: TextAlign.center,
          style: AppTextStyle.lato400Style12,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            AppStrings.termsAndCondition,
            textAlign: TextAlign.center,
            style: AppTextStyle.lato400Style12.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

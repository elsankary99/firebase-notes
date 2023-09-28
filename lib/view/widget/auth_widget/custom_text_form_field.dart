import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.orange,
      decoration: InputDecoration(
          prefixIconColor: AppColors.orange,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange, width: 1.5)),
          hintText: AppStrings.emailAddress,
          prefixIcon: const Icon(FontAwesomeIcons.envelope),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}

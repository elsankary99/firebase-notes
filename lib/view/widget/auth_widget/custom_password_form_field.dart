import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPasswordFormField extends StatefulWidget {
  const CustomPasswordFormField({
    super.key,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hide,
      cursorColor: AppColors.orange,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  hide = !hide;
                });
              },
              icon: Icon(
                hide ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                color: hide ? AppColors.grey : AppColors.orange,
              )),
          prefixIconColor: AppColors.orange,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange, width: 1.5)),
          hintText: AppStrings.password,
          prefixIcon: const Icon(Icons.lock),
          border: const OutlineInputBorder()),
    );
  }
}

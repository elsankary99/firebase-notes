import 'package:fb_note/core/constant/app-colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final String hint;
  const CustomTextFormField(
      {super.key, required this.icon, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.orange,
      decoration: InputDecoration(
          prefixIconColor: AppColors.orange,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.orange, width: 1.5)),
          hintText: hint,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }
}

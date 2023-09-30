import 'package:fb_note/core/constant/app-colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final IconData icon;
  final String hint;
  const CustomTextFormField(
      {super.key, required this.icon, required this.hint, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This felid is required";
        }
        return null;
      },
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

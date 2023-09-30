import 'package:fb_note/core/constant/app-colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isActive,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        activeColor: AppColors.orange,
        onChanged: (value) {
          setState(() {
            isActive = value!;
          });
        });
  }
}

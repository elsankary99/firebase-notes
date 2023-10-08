import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class ClearImageButton extends StatelessWidget {
  final void Function()? onPressed;
  const ClearImageButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).canvasColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: const BorderSide(color: Colors.grey))),
        child: Text(
          AppStrings.clearImage,
          style: AppTextStyle.lato400Style18.copyWith(color: Colors.grey),
        ));
  }
}

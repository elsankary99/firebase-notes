import 'package:fb_note/core/constant/app_colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPasswordFormField extends StatefulWidget {
  final void Function(String)? onChanged;
  const CustomPasswordFormField({
    super.key,
    this.onChanged,
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
      style: Theme.of(context).textTheme.titleSmall,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "This felid is required";
        }
        return null;
      },
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
          hintStyle: Theme.of(context).textTheme.titleSmall,
          prefixIcon: const Icon(Icons.lock),
          border: const OutlineInputBorder()),
    );
  }
}

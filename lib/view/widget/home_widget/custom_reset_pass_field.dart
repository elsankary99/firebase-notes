import 'package:fb_note/core/constant/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomResetPasswordField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String hint;
  const CustomResetPasswordField({
    super.key,
    this.onChanged,
    this.validator,
    required this.hint,
  });

  @override
  State<CustomResetPasswordField> createState() =>
      _CustomResetPasswordFieldState();
}

class _CustomResetPasswordFieldState extends State<CustomResetPasswordField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      onChanged: widget.onChanged,
      validator: widget.validator,
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
          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          prefixIcon: const Icon(Icons.lock),
          border: const OutlineInputBorder()),
    );
  }
}

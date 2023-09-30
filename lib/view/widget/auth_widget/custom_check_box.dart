import 'package:fb_note/provider/auth/sidnup_provider/signup_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends ConsumerWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(signUpProvider.notifier);
    ref.watch(signUpProvider);
    return Checkbox(
      value: provider.isSelected,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      activeColor: AppColors.orange,
      onChanged: (value) {
        provider.checkBoxChanged(value!);
      },
    );
  }
}

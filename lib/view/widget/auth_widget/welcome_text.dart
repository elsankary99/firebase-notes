import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  final String title1;
  final String title2;
  const WelcomeText({
    super.key,
    required this.title1,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title1,
          style:
              Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: context.height * 0.01),
        Text(title2, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

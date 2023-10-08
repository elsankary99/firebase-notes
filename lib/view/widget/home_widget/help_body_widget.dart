import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpBodyWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData icon;
  const HelpBodyWidget({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(top: context.height * 0.03),
          padding: const EdgeInsets.all(20),
          height: context.height * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.orange,
          ),
          child: Row(children: [
            Icon(
              icon,
              size: 45.sp,
              color: Theme.of(context).canvasColor,
            ),
            SizedBox(
              width: context.width * 0.05,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).canvasColor),
                ),
                SizedBox(
                  height: context.height * 0.005,
                ),
                Text(
                  AppStrings.tapToView,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).canvasColor),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(children: [
        CircleAvatar(radius: 40.r),
        SizedBox(width: context.width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed Ebrahim',
              style: AppTextStyle.lato400Style18,
            ),
            SizedBox(height: context.height * 0.01),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: AppTextStyle.lato400Style18,
            ),
          ],
        ),
      ]),
    );
  }
}

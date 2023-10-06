import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DeleteAccountPage extends ConsumerWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.usb_rounded),
            SizedBox(height: context.height * 0.1),
            Text(
              "Delete your account",
              textAlign: TextAlign.center,
              style: AppTextStyle.lato400Style24,
            ),
            SizedBox(height: context.height * 0.02),
            Text(
              "You will lose all of your data by \n deleting your account. This action \n cannot be undone.",
              textAlign: TextAlign.center,
              style: AppTextStyle.lato500Style14.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: context.height * 0.1),
            SizedBox(
              width: double.infinity,
              height: context.height * 0.06,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[100]),
                  child: Text(
                    "Delete Account",
                    style: AppTextStyle.lato700Style14
                        .copyWith(color: Colors.red[900]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

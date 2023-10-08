import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/delete_account_provider/delete_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DeleteAccountPage extends ConsumerWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deleteAccountProvider);
    final provider = ref.read(deleteAccountProvider.notifier);
    ref.listen(
      deleteAccountProvider,
      (previous, next) {
        if (next is DeleteAccountSuccess) {
          context.router.replace(const SignUpRoute());

          customToast(title: "Your Account deleted Successfully");
        }
        if (next is DeleteAccountLoading) {
          context.router.pop();
        }
        if (next is DeleteAccountError) {
          customToast(title: next.message, color: Colors.red);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: state is DeleteAccountLoading
            ? const CustomCircleIndicator(
                color: AppColors.orange,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber,
                    color: Colors.red,
                    size: 100.sp,
                  ),
                  SizedBox(height: context.height * 0.1),
                  Text(
                    "Delete your account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: context.height * 0.02),
                  Text(
                    "You will lose all of your data by \n deleting your account. This action \n cannot be undone.",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.lato500Style14.copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(height: context.height * 0.1),
                  SizedBox(
                    width: double.infinity,
                    height: context.height * 0.06,
                    child: ElevatedButton(
                        onPressed: () {
                          showMyDialog(context,
                              btnTitle: "Submit",
                              header: "Delete Account",
                              title: "You will lose all of your data",
                              onPressed: () async {
                            await provider.deleteAccount();
                          });
                        },
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

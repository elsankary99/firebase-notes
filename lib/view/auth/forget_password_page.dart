import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/reset_forget_password/reset_and_forget_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(resetAndForgetProvider.notifier);
    final state = ref.watch(resetAndForgetProvider);
    ref.listen(
      resetAndForgetProvider,
      (previous, next) {
        if (next is ForgetPasswordSuccess) {
          customToast(title: "The link has been sent successfully");
          context.router.pop();
        }
        if (next is ForgetPasswordLoading) {
          context.router.pop();
        }
        if (next is ForgetPasswordError) {
          customToast(title: next.message, color: Colors.red);
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(
              FontAwesomeIcons.chevronLeft,
              color: AppColors.orange,
            )),
        centerTitle: true,
        title: Text(
          AppStrings.forgot_pwd,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          SliverToBoxAdapter(
            child: Text(AppStrings.pleaseEnterYourAccount,
                style: Theme.of(context).textTheme.titleSmall),
          ),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          SliverToBoxAdapter(
              child: Form(
            key: provider.formKey,
            child: CustomTextFormField(
                onChanged: (email) {
                  provider.email = email.trim();
                },
                hint: AppStrings.emailAddress,
                icon: FontAwesomeIcons.envelope),
          )),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.35)),
          SliverToBoxAdapter(
              child: CustomOrangeButton(
                  onPressed: () {
                    if (provider.formKey.currentState!.validate()) {
                      showMyDialog(context,
                          btnTitle: "Submit",
                          header: "Forget Password",
                          title:
                              "We'll send a link for\n''${provider.email}''\n to reset your password ",
                          onPressed: () async {
                        await provider.forgetPassword();
                      });
                    }
                  },
                  text: AppStrings.submit.toUpperCase(),
                  child: state is ForgetPasswordLoading
                      ? const CustomCircleIndicator()
                      : null)),
          SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
        ]),
      ),
    );
  }
}

import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/provider/auth/login_provider/login_provider.dart';
import 'package:fb_note/view/widget/auth_widget/custom_password_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/custom_text_form_field.dart';
import 'package:fb_note/view/widget/auth_widget/forget_password_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormLoginValidator extends ConsumerWidget {
  const FormLoginValidator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(loginProvider.notifier);
    return Form(
        key: provider.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
                onChanged: (email) {
                  provider.email = email;
                },
                hint: AppStrings.emailAddress,
                icon: FontAwesomeIcons.envelope),
            SizedBox(height: context.height * 0.03),
            CustomPasswordFormField(
              onChanged: (password) {
                provider.password = password;
              },
            ),
            SizedBox(height: context.height * 0.02),
            const CustomForgetPassText(),
            SizedBox(height: context.height * 0.15),
            CustomOrangeButton(
                onPressed: () {
                  ref.read(loginProvider.notifier).login();
                },
                text: AppStrings.login),
          ],
        ));
  }
}

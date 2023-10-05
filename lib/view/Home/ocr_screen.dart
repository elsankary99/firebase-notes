import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/provider/home_provider/imagetotext_provider/image_to_text_provider.dart';
import 'package:fb_note/view/widget/home_widget/clear_iamge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class OCRScreen extends ConsumerStatefulWidget {
  const OCRScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OCRScreenState();
}

class _OCRScreenState extends ConsumerState<OCRScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = ref.read(imageToTextProvider.notifier);
    final state = ref.watch(imageToTextProvider);
    ref.listen(
      imageToTextProvider,
      (previous, next) {
        if (next is PickImageLoading) {
          context.router.pop();
        }
      },
    );

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            AppStrings.ocrScreen,
            style: AppTextStyle.lato500Style34,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Container(
                  height: context.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: AppColors.lightGrey,
                      image: provider.image != null
                          ? DecorationImage(
                              image: FileImage(provider.image!),
                              fit: BoxFit.fill)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.orange, width: 2)),
                  child: InkWell(
                    onTap: () {
                      getImage(
                        context,
                        galleryBtn: () {
                          provider.pickImage(ImageSource.gallery);
                        },
                        cameraBtn: () {
                          provider.pickImage(ImageSource.camera);
                        },
                      );
                    },
                    child: provider.image == null
                        ? Icon(
                            Icons.add_a_photo_outlined,
                            size: 45.sp,
                            color: AppColors.orange,
                          )
                        : null,
                  ),
                ),
                SizedBox(height: context.height * 0.02),
                Container(
                  height: context.height * 0.3,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.orange, width: 2)),
                  child: (state is ImageToTextLoading)
                      ? const CustomCircleIndicator(
                          color: AppColors.orange,
                        )
                      : ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            SelectableText(
                              provider.title,
                              style: AppTextStyle.lato400Style18,
                            ),
                          ],
                        ),
                ),
                SizedBox(height: context.height * 0.05),
                SizedBox(
                    height: context.height * 0.05,
                    child: Row(
                      children: [
                        ClearImageButton(onPressed: () {
                          provider.deleteImage();
                        }),
                        SizedBox(width: context.width * 0.05),
                        CustomOrangeButton(
                          text: "Save as Note",
                          onPressed: () {
                            context.router
                                .push(AddNoteRoute(subtitle: provider.title));
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}

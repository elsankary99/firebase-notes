import 'dart:developer';
import 'dart:io';

import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_orange_buton.dart';
import 'package:fb_note/view/widget/home_widget/clear_iamge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class OCRScreen extends ConsumerStatefulWidget {
  const OCRScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OCRScreenState();
}

class _OCRScreenState extends ConsumerState<OCRScreen> {
  File? _image;
  String title = "";
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      setState(() {
        _image = File(image.path);
      });
    } catch (e) {
      log("===image==${e.toString()}=======");
    }
  }

  Future textRecognition(File image) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFilePath(image.path);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    setState(() {
      title = recognizedText.text;
    });
    log("==path===$title=====");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                      color: AppColors.lightGrey,
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image!), fit: BoxFit.fill)
                          : null,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.orange, width: 2)),
                  child: _image == null
                      ? Icon(
                          Icons.add_a_photo_outlined,
                          size: 45.sp,
                          color: AppColors.orange,
                        )
                      : null,
                ),
                SizedBox(height: context.height * 0.02),
                Container(
                  height: context.height * 0.3,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.orange, width: 2)),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SelectableText(
                        title,
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
                        //! glary
                        ClearImageButton(onPressed: () {
                          pickImage(ImageSource.gallery).then((value) {
                            if (_image != null) {
                              textRecognition(_image!);
                            }
                          });
                        }),
                        SizedBox(width: context.width * 0.05),
                        CustomOrangeButton(
                          text: AppStrings.scanImage,
                          onPressed: () {},
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

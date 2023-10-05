import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

part 'image_to_text_state.dart';

final imageToTextProvider =
    StateNotifierProvider<ImageToTextProvider, ImageToTextState>(
        (ref) => ImageToTextProvider());

class ImageToTextProvider extends StateNotifier<ImageToTextState> {
  ImageToTextProvider() : super(ImageToTextInitial());
  File? image;
  String title = "";

  Future<void> pickImage(ImageSource source) async {
    state = PickImageLoading();

    try {
      final imagePath = await ImagePicker().pickImage(source: source);
      if (imagePath == null) return;
      image = File(imagePath.path);
      if (image != null) {
        await imageToText(image!);
      }
      state = PickImageSuccess();
    } catch (e) {
      state = PickImageError(e.toString());
    }
  }

  Future<void> imageToText(File image) async {
    state = ImageToTextLoading();

    try {
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final inputImage = InputImage.fromFilePath(image.path);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      title = recognizedText.text;
      log("==path===$title=====");
      state = ImageToTextSuccess();
    } catch (e) {
      state = ImageToTextError(e.toString());
    }
  }
}

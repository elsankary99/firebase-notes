import 'package:fb_note/core/constant/app_images.dart';

class OnboardingModel {
  final String image;
  final String title1;
  final String title2;

  OnboardingModel(
      {required this.image, required this.title1, required this.title2});
}

List<OnboardingModel> onboardingList = [
  OnboardingModel(
    image: Assets.assetsImagesOnboard,
    title1: "Take Notes",
    title2: "Quickly capture what’s on your mind",
  ),
  OnboardingModel(
    image: Assets.assetsImagesOnboard1,
    title1: "To-dos",
    title2: "List out your day-to-day tasks",
  ),
  OnboardingModel(
    image: Assets.assetsImagesOnboard2,
    title1: "Image to Text Converter",
    title2: "Upload your images and convert to text",
  ),
];

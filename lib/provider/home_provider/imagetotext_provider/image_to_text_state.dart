part of 'image_to_text_provider.dart';

abstract class ImageToTextState {
  const ImageToTextState();
}

class ImageToTextInitial extends ImageToTextState {}

//?Pick Image
class PickImageLoading extends ImageToTextState {}

class PickImageSuccess extends ImageToTextState {}

class PickImageError extends ImageToTextState {
  final String message;
  const PickImageError(this.message);
}

//? Image To Text
class ImageToTextLoading extends ImageToTextState {}

class ImageToTextSuccess extends ImageToTextState {}

class ImageToTextError extends ImageToTextState {
  final String message;
  const ImageToTextError(this.message);
}

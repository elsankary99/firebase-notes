import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

part 'profile_image_state.dart';

final profileImageProvider =
    StateNotifierProvider<ProfileImageProvider, ProfileImageState>(
        (ref) => ProfileImageProvider());

class ProfileImageProvider extends StateNotifier<ProfileImageState> {
  ProfileImageProvider() : super(ProfileImageInitial());

  File? image;
  String title = "";
  String? imageUrl;
  Future<void> pickProfileImage(ImageSource source) async {
    state = ProfileImageLoading();

    try {
      final imagePath = await ImagePicker().pickImage(source: source);
      if (imagePath == null) return;
      image = File(imagePath.path);
      if (image != null) {
        final imageName = basename(imagePath.path);
        final storageRef = FirebaseStorage.instance.ref(imageName);
        await storageRef.putFile(image!);
        imageUrl = await storageRef.getDownloadURL();
      }
      state = ProfileImageSuccess();
    } catch (e) {
      state = ProfileImageError(e.toString());
    }
  }
}

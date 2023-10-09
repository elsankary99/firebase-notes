import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_image_state.dart';

final profileImageProvider =
    StateNotifierProvider<ProfileImageProvider, ProfileImageState>(
        (ref) => ProfileImageProvider());

class ProfileImageProvider extends StateNotifier<ProfileImageState> {
  ProfileImageProvider() : super(ProfileImageInitial());

  File? image;
  String title = "";
  String? imageUrl;
  final userImage = FirebaseFirestore.instance.collection("userImage");

  Future<void> pickProfileImage(ImageSource source) async {
    state = ProfileImageLoading();

    try {
      final imagePath = await ImagePicker().pickImage(source: source);
      if (imagePath == null) return;
      image = File(imagePath.path);
      if (image != null) {
        // final imageName = basename(imagePath.path);
        final storageRef = FirebaseStorage.instance
            .ref(FirebaseAuth.instance.currentUser!.uid);
        await storageRef.putFile(image!);
        imageUrl = await storageRef.getDownloadURL();
        await saveImage(imageUrl!);
      }
      state = ProfileImageSuccess();
    } catch (e) {
      log("======${e.toString()}=======");

      state = ProfileImageError(e.toString());
    }
  }

  saveImage(String url) async {
    try {
      await userImage
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({'image': url});
    } catch (e) {
      log("======${e.toString()}=======");
    }
  }
}

final getImageProvider = FutureProvider<String?>((ref) async {
  final userImage = FirebaseFirestore.instance.collection("userImage");
  final url = await userImage.doc(FirebaseAuth.instance.currentUser!.uid).get();
  return url.data()!["image"];
});

import 'package:fb_note/core/constant/app_images.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/home_provider/profile_image/profile_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class UserInformation extends ConsumerWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileImageProvider.notifier);

    ref.watch(profileImageProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(children: [
        SizedBox(
          width: context.width * 0.24,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: SizedBox(
                  height: context.height * 0.12,
                  width: context.height * 0.16,
                  child: ref.watch(getImageProvider).when(
                        skipLoadingOnRefresh: false,
                        data: (data) => data != null
                            ? Image.network(
                                data,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(Assets.assetsImagesUser),
                        error: (error, stackTrace) => customToast(
                            title: error.toString(), color: Colors.red),
                        loading: () => const CustomCircleIndicator(
                          color: AppColors.orange,
                        ),
                      ),
                  // foregroundImage: const AssetImage(Assets.assetsImagesUser),
                ),
              ),
              Positioned(
                  right: -0.01,
                  bottom: 1,
                  child: GestureDetector(
                    onTap: () {
                      getImage(context, cameraBtn: () async {
                        await provider.pickProfileImage(ImageSource.camera);
                        router.pop();
                        ref.invalidate(getImageProvider);
                      }, galleryBtn: () async {
                        await provider.pickProfileImage(ImageSource.gallery);
                        router.pop();
                        ref.invalidate(getImageProvider);
                      });
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 15.r,
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.grey,
                        )),
                  )),
            ],
          ),
        ),
        SizedBox(width: context.width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ahmed Ebrahim',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: context.height * 0.01),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ]),
    );
  }
}

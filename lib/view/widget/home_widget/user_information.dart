import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app_images.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/sidnup_provider/signup_provider.dart';
import 'package:fb_note/provider/home_provider/profile_image/profile_image_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fb_note/core/constant/app_colors.dart';
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
    ref.listen(
      profileImageProvider,
      (previous, next) {
        if (next is ProfileImageLoading) {
          context.router.pop();
        }
        if (next is ProfileImageError) {
          customToast(title: next.message);
        }
        if (next is ProfileImageSuccess) {
          ref.invalidate(getImageProvider);
          customToast(title: "Image added successfully");
        }
      },
    );

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
                        data: (data) => data == null
                            ? Image.asset(Assets.assetsImagesUser)
                            : Image.network(
                                data,
                                fit: BoxFit.fill,
                              ),
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
                        // ref.invalidate(getImageProvider);
                      }, galleryBtn: () async {
                        await provider.pickProfileImage(ImageSource.gallery);
                        // ref.invalidate(getImageProvider);
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
            ref.watch(getUserNameProvider).when(
                data: (data) => Text(
                      data.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                error: (error, _) =>
                    customToast(title: error.toString(), color: Colors.red),
                loading: () => const CustomCircleIndicator(
                      color: AppColors.orange,
                    )),
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

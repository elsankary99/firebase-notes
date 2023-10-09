import 'package:fb_note/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyle {
  static final lato300Style18 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontFamily: "Lato",
  );
  static final lato400Style18 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: "Lato",
  );
  static final lato400Style24 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: "Lato",
  );
  static final lato400Style14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    fontFamily: "Lato",
  );
  static final lato400Style12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontFamily: "Lato",
  );
  static final lato500Style24 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: "Lato",
  );
  static final lato500Style34 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: "Lato",
  );
  static final lato500Style14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    fontFamily: "Lato",
  );
  static final lato700Style18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontFamily: "Lato",
  );
  static final lato700Style40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: "Lato",
  );
  static final lato700Style14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.orange,
    fontFamily: "Lato",
  );
}

// 100 – Thin
// 200 – Extra Light (Ultra Light)
// 300 – Light
// 400 – Normal
// 500 – Medium
// 600 – Semi Bold (Demi Bold)
// 700 – Bold
// 800 – Extra Bold (Ultra Bold)
// 900 – Black (Heavy)
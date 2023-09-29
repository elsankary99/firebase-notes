import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

AppBar get customAppBar => AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        AppStrings.notes,
        style: AppTextStyle.lato500Style24,
      ),
    );

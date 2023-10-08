import 'package:fb_note/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

SliverAppBar get customAppBar => const SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        AppStrings.notes,
      ),
    );

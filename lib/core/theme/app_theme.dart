import 'package:fb_note/core/constant/app_colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
    canvasColor: isDarkTheme ? Colors.grey[900] : Colors.white,
    hintColor: isDarkTheme ? Colors.grey[700] : AppColors.lightGrey,
    scaffoldBackgroundColor: isDarkTheme ? Colors.grey[900] : Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .copyWith(
          titleSmall: AppTextStyle.lato300Style18,
          titleMedium: AppTextStyle.lato400Style12,
          titleLarge: AppTextStyle.lato400Style14,
          bodyMedium: AppTextStyle.lato400Style18,
          bodyLarge: AppTextStyle.lato500Style14,
          labelMedium: AppTextStyle.lato400Style24,
        )
        .apply(
          bodyColor: isDarkTheme ? Colors.white : Colors.black,
        ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.orange),
    ),
    listTileTheme: ListTileThemeData(
      titleTextStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: isDarkTheme ? Colors.white : Colors.black),
      iconColor: AppColors.orange,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColors.orange),
        titleTextStyle: AppTextStyle.lato500Style24
            .copyWith(color: isDarkTheme ? Colors.white : Colors.black)),
  );
}

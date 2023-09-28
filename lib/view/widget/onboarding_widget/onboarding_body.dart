import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/data/model/onboarding_model.dart';
import 'package:fb_note/view/widget/onboarding_widget/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({
    super.key,
  });

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  int pageIdex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.52,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                pageIdex = value;
              });
            },
            physics: const BouncingScrollPhysics(),
            itemCount: onboardingList.length,
            itemBuilder: (context, index) {
              return OnboardingWidget(
                data: onboardingList[index],
              );
            },
          ),
        ),
        SizedBox(height: context.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...onboardingList.asMap().keys.map((e) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                height: context.height * 0.016,
                width:
                    pageIdex == e ? context.width * 0.15 : context.width * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: pageIdex == e ? AppColors.orange : Colors.white),
              );
            })
          ],
        )
      ],
    );
  }
}

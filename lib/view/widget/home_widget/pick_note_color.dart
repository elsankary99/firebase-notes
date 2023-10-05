import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/provider/home_provider/note_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickNoteColor extends ConsumerStatefulWidget {
  const PickNoteColor({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PickNoteColorState();
}

class _PickNoteColorState extends ConsumerState<PickNoteColor> {
  int currentIndex = 0;
  bool open = false;
  List<Color> colors = [
    const Color(0xff003f7d),
    const Color(0xffff8e00),
    const Color(0xff002347),
    const Color(0xfffd7702),
    const Color(0xff003366),
    const Color(0xffff5003),
  ];
  @override
  Widget build(BuildContext context) {
    ref.read(notesProvider.notifier).color = colors[currentIndex].value;
    return SizedBox(
      height: open ? context.height * 0.1 : null,
      child: Column(
        children: [
          open
              ? Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: colors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundColor: colors[index],
                            child: currentIndex == index
                                ? const Icon(
                                    FontAwesomeIcons.check,
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  open = !open;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select color ...",
                    style: AppTextStyle.lato400Style18,
                  ),
                  Icon(
                    open
                        ? FontAwesomeIcons.chevronUp
                        : FontAwesomeIcons.chevronDown,
                    color: AppColors.orange,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/auth/note_provider/notes_provider.dart';
import 'package:fb_note/view/widget/home_widget/add_note_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AddNotePage extends ConsumerStatefulWidget {
  const AddNotePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddNotePageState();
}

class _AddNotePageState extends ConsumerState<AddNotePage> {
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
    final provider = ref.read(notesProvider.notifier);
    final state = ref.watch(notesProvider);
    ref.read(notesProvider.notifier).color = colors[currentIndex].value;
    ref.listen(
      notesProvider,
      (previous, currentState) {
        if (currentState is AddNoteSuccess) {
          customToast(title: "Note Added Successfully");
          context.router.pop();
        }
      },
    );

    return Scaffold(
      body: state is AddNoteLoading
          ? const CustomCircleIndicator(color: AppColors.orange)
          : CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: AppColors.orange,
                      )),
                  actions: [
                    IconButton(
                        onPressed: () async {
                          await provider.addNotes();
                          ref.invalidate(getNotesProvider);
                        },
                        icon: Icon(
                          FontAwesomeIcons.floppyDisk,
                          color: AppColors.orange,
                          size: 24.sp,
                        )),
                  ],
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select color ...",
                              style: AppTextStyle.lato400Style18,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    open = !open;
                                  });
                                },
                                child: Icon(
                                  open
                                      ? FontAwesomeIcons.chevronUp
                                      : FontAwesomeIcons.chevronDown,
                                  color: AppColors.orange,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
                const SliverToBoxAdapter(child: AddNoteFelids()),
              ],
            ),
    );
  }
}

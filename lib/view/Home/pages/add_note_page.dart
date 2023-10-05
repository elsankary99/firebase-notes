import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/provider/home_provider/note_provider/notes_provider.dart';
import 'package:fb_note/view/widget/home_widget/add_note_fields.dart';
import 'package:fb_note/view/widget/home_widget/pick_note_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class AddNotePage extends ConsumerWidget {
  final String? subtitle;
  const AddNotePage({this.subtitle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(notesProvider.notifier);
    final state = ref.watch(notesProvider);
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
                const SliverToBoxAdapter(child: PickNoteColor()),
                SliverToBoxAdapter(child: AddNoteFelids(subtitle: subtitle)),
              ],
            ),
    );
  }
}

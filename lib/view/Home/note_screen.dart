import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_strings.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/provider/home_provider/note_provider/notes_provider.dart';
import 'package:fb_note/view/widget/home_widget/create_first_note.dart';
import 'package:fb_note/view/widget/home_widget/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteScreen extends ConsumerWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getNotesProvider);

    return Stack(
      children: [
        Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                AppStrings.notes,
                style: AppTextStyle.lato500Style24,
              ),
            ),
            Expanded(
              child: data.when(
                data: (data) {
                  return data.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return NoteCard(data: data[index]);
                          },
                        )
                      : const CreateYourFirstNoteWidget();
                },
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            // const SliverToBoxAdapter(child: CreateYourFirstNoteWidget()),
          ],
        ),
        Positioned(
          bottom: context.height * 0.15,
          right: context.width * 0.05,
          child: FloatingActionButton(
            onPressed: () {
              context.router.push(const AddNoteRoute());
            },
            backgroundColor: AppColors.orange,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

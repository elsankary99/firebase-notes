import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/view/widget/home_widget/create_first_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteScreen extends ConsumerWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.2)),
            const SliverToBoxAdapter(child: CreateYourFirstNoteWidget()),
          ],
        ),
        Positioned(
          bottom: context.height * 0.15,
          right: context.width * 0.05,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.orange,
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}

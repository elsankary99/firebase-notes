import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/provider/auth/note_provider/notes_provider.dart';
import 'package:fb_note/view/widget/home_widget/create_first_note.dart';
import 'package:fb_note/view/widget/home_widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteScreen extends ConsumerWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getNotesProvider);

    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            customAppBar,
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.015)),
            SliverToBoxAdapter(
                child: SizedBox(
              height: context.height,
              child: data.when(
                data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: Text(data[index]['title']),
                      ),
                    );
                  },
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )),
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
        )
      ],
    );
  }
}

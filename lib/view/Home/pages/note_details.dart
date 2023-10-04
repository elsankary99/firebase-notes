import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/data/model/notes_model.dart';
import 'package:fb_note/provider/auth/note_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class NoteDetailsPage extends ConsumerWidget {
  final NotesModel data;

  const NoteDetailsPage({required this.data, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log(data.id!);
          await ref.read(notesProvider.notifier).deleteNote(path: data.id!);
          ref.invalidate(getNotesProvider);
          router.pop();
        },
        backgroundColor: Colors.red,
        child: const Icon(FontAwesomeIcons.trashCan),
      ),
      body: CustomScrollView(
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextFormField(
                      enabled: false,
                      maxLength: 30,
                      controller: TextEditingController(text: data.title),
                      style: AppTextStyle.lato500Style34,
                      decoration:
                          const InputDecoration(border: InputBorder.none)),
                  TextFormField(
                      enabled: false,
                      controller: TextEditingController(text: data.subTitle),
                      style: AppTextStyle.lato500Style24,
                      maxLines: null,
                      decoration:
                          const InputDecoration(border: InputBorder.none)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

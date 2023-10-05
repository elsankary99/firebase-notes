import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/widget/custom_circle_indicator.dart';
import 'package:fb_note/core/widget/custom_toast.dart';
import 'package:fb_note/data/model/notes_model.dart';
import 'package:fb_note/provider/auth/note_provider/notes_provider.dart';
import 'package:fb_note/view/widget/home_widget/edit_note_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class NoteDetailsPage extends ConsumerStatefulWidget {
  final NotesModel data;

  const NoteDetailsPage({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NoteDetailsPageState();
}

class _NoteDetailsPageState extends ConsumerState<NoteDetailsPage> {
  bool edit = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  NotesModel notesModel = NotesModel();
  @override
  void initState() {
    notesModel = widget.data;
    titleController.text = widget.data.title!;
    subTitleController.text = widget.data.subTitle!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(notesProvider.notifier);
    final state = ref.watch(notesProvider);
    ref.listen(notesProvider, (previous, next) {
      if (next is DeleteNoteSuccess) {
        customToast(title: "Note Deleted Successfully");
        context.router.pop();
      }
      if (next is EditNoteSuccess) {
        customToast(title: "Note Edited Successfully");
      }
      if (next is DeleteNoteError) {
        customToast(title: next.message, color: Colors.red);
      }
    });
    return Scaffold(
      floatingActionButton: !edit
          ? FloatingActionButton(
              onPressed: () async {
                log(widget.data.id!);
                await provider.deleteNote(path: widget.data.id!);
                ref.invalidate(getNotesProvider);
              },
              backgroundColor: Colors.red,
              child: state is DeleteNoteLoading
                  ? const CustomCircleIndicator()
                  : const Icon(FontAwesomeIcons.trashCan),
            )
          : null,
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
            actions: [
              IconButton(
                  onPressed: () async {
                    if (edit) {
                      await provider.editNotes(notesModel);
                      ref.invalidate(getNotesProvider);
                      log("====${notesModel.title} ,${notesModel.subTitle} ,${notesModel.color} }======");
                    }
                    setState(() {
                      if (provider.formKey.currentState!.validate()) {
                        edit = !edit;
                      }
                    });
                  },
                  icon: Icon(
                    edit
                        ? FontAwesomeIcons.floppyDisk
                        : FontAwesomeIcons.penToSquare,
                    color: AppColors.orange,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: EditNoteValidator(
                  notesModel: notesModel,
                  edit: edit,
                  titleController: titleController,
                  subTitleController: subTitleController),
            ),
          ),
        ],
      ),
    );
  }
}

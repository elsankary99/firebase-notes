import 'package:fb_note/data/model/notes_model.dart';
import 'package:fb_note/provider/home_provider/note_provider/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditNoteValidator extends ConsumerWidget {
  const EditNoteValidator({
    super.key,
    required this.notesModel,
    required this.edit,
    required this.titleController,
    required this.subTitleController,
  });

  final NotesModel notesModel;
  final bool edit;
  final TextEditingController titleController;
  final TextEditingController subTitleController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.read(notesProvider.notifier).formKey,
      child: Column(
        children: [
          TextFormField(
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "this field is required";
                }
                return null;
              },
              onSaved: (title) {
                notesModel.title = title;
              },
              // onSaved: ,
              enabled: edit,
              maxLength: 30,
              maxLines: null,
              controller: titleController,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 30.sp),
              decoration: const InputDecoration(border: InputBorder.none)),
          TextFormField(
              onSaved: (subTitle) {
                notesModel.subTitle = subTitle;
              },
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "this field is required";
                }
                return null;
              },
              enabled: edit,
              controller: subTitleController,
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
              )),
        ],
      ),
    );
  }
}

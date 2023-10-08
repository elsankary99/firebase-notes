import 'package:fb_note/provider/home_provider/note_provider/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNoteFelids extends ConsumerWidget {
  final String? subtitle;
  const AddNoteFelids({this.subtitle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(notesProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: provider.formKey,
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "this Felid is required";
                  }
                  return null;
                },
                onSaved: (title) {
                  provider.title = title!.trim();
                },
                maxLength: 30,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 30.sp),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 30.sp))),
            TextFormField(
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "this Felid is required";
                  }
                  return null;
                },
                controller: subtitle != null
                    ? TextEditingController(text: subtitle)
                    : null,
                onSaved: (subTitle) {
                  provider.subTitle = subTitle!.trim();
                },
                style: Theme.of(context).textTheme.labelMedium,
                maxLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Sub Title",
                    hintStyle: Theme.of(context).textTheme.labelMedium)),
          ],
        ),
      ),
    );
  }
}

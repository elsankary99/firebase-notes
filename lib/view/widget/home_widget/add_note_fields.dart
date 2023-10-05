import 'package:fb_note/provider/home_provider/note_provider/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

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
                style: AppTextStyle.lato500Style34,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Title")),
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
                style: AppTextStyle.lato500Style24,
                maxLines: null,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Sub Title")),
          ],
        ),
      ),
    );
  }
}

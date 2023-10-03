import 'package:fb_note/provider/auth/note_provider/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class AddNoteFelids extends ConsumerWidget {
  const AddNoteFelids({
    super.key,
  });

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
                onChanged: (title) {
                  provider.title = title.trim();
                },
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
                onChanged: (subTitle) {
                  provider.subTitle = subTitle.trim();
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

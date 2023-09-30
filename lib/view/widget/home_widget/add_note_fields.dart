import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class AddNoteFelids extends StatelessWidget {
  const AddNoteFelids({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextFormField(
              style: AppTextStyle.lato500Style34,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title")),
          TextFormField(
              style: AppTextStyle.lato500Style24,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title")),
        ],
      ),
    );
  }
}

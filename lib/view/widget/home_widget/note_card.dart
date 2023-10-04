import 'package:auto_route/auto_route.dart';
import 'package:fb_note/core/constant/app-colors.dart';
import 'package:fb_note/core/constant/app_text_style.dart';
import 'package:fb_note/core/extension/media_query.dart';
import 'package:fb_note/core/router/app_router.dart';
import 'package:fb_note/data/model/notes_model.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final NotesModel data;
  const NoteCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(NoteDetailsRoute(data: data));
      },
      child: Container(
        height: context.height * 0.18,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
            color: AppColors.orange, borderRadius: BorderRadius.circular(15)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(data.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.lato500Style24),
          SizedBox(height: context.height * 0.01),
          Expanded(
            child: Text(
              data.subTitle!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.lato400Style18,
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String? userId;
  String? id;
  String? title;
  String? subTitle;
  int? color;

  NotesModel({this.userId, this.id, this.title, this.subTitle, this.color});

  factory NotesModel.fromJson(
          QueryDocumentSnapshot<Map<String, dynamic>> json) =>
      NotesModel(
        userId: json.data()['user_id'] as String?,
        id: json.id,
        title: json.data()['title'] as String?,
        subTitle: json.data()['sub_title'] as String?,
        color: json.data()['color'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'id': id,
        'title': title,
        'sub_title': subTitle,
        'color': color,
      };
}

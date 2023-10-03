import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'notes_state.dart';

final notesProvider =
    StateNotifierProvider<NotesProvider, NotesState>((ref) => NotesProvider());

class NotesProvider extends StateNotifier<NotesState> {
  NotesProvider() : super(NotesInitial());
  String? title;
  String? subTitle;

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  Future<void> addNotes() {
    return notes
        .add({
          'title': title, // John Doe
          'sub_title': subTitle, // Stokes and Sons
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }
}

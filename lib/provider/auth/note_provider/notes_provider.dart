import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'notes_state.dart';

final notesProvider =
    StateNotifierProvider<NotesProvider, NotesState>((ref) => NotesProvider());

class NotesProvider extends StateNotifier<NotesState> {
  NotesProvider() : super(NotesInitial());
  String? title;
  String? subTitle;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final notes = FirebaseFirestore.instance.collection('notes');
  Future<void> addNotes() async {
    state = AddNoteLoading();
    log("AddNoteLoading");

    try {
      await notes.add({
        'title': title, // John Doe
        'sub_title': subTitle, // Stokes and Sons
      });
      state = AddNoteSuccess();

      log("User Added Successfully");
    } catch (e) {
      state = AddNoteError(e.toString());

      log("Failed to add user: $e");
    }
    // .then((value) => log("User Added"))
    // .catchError((error) => );
  }
}

final getNotesProvider =
    FutureProvider<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        (ref) async {
  final notes = await FirebaseFirestore.instance.collection('notes').get();

  return notes.docs;
});

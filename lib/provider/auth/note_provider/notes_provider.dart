import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_note/data/model/notes_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        "user_id": FirebaseAuth.instance.currentUser!.uid,
        "title": title, // John Doe
        "sub_title": subTitle, // Stokes and Sons
        "color": Colors.red.value
      });
      state = AddNoteSuccess();

      log("User Added Successfully");
    } catch (e) {
      state = AddNoteError(e.toString());

      log("Failed to add user: $e");
    }
  }

  //   Future<void> editNotes() async {
  //   state = AddNoteLoading();
  //   log("AddNoteLoading");

  //   try {
  //     await notes.where("id",isEqualTo: "1").({
  //       "user_id": FirebaseAuth.instance.currentUser!.uid,
  //       "title": title, // John Doe
  //       "sub_title": subTitle, // Stokes and Sons
  //       "color": Colors.red.value
  //     });
  //     state = AddNoteSuccess();

  //     log("User Added Successfully");
  //   } catch (e) {
  //     state = AddNoteError(e.toString());

  //     log("Failed to add user: $e");
  //   }
  // }

  Future<void> deleteNote({required String path}) async {
    try {
      await notes.doc(path).delete();
      log("======Delete Successfully======");
    } catch (e) {
      log(e.toString());
    }
  }
}

final getNotesProvider = FutureProvider<List<NotesModel>>((ref) async {
  final notes = await FirebaseFirestore.instance
      .collection('notes')
      .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get();

  return notes.docs.map((e) => NotesModel.fromJson(e)).toList();
});

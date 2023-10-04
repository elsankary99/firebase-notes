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
  int? color;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final notes = FirebaseFirestore.instance.collection('notes');
  //!Add note
  Future<void> addNotes() async {
    if (formKey.currentState!.validate()) {
      state = AddNoteLoading();
      log("AddNoteLoading");

      try {
        await notes.add({
          "user_id": FirebaseAuth.instance.currentUser!.uid,
          "title": title, // John Doe
          "sub_title": subTitle, // Stokes and Sons
          "color": color,
        });
        state = AddNoteSuccess();

        log("User Added Successfully");
      } catch (e) {
        state = AddNoteError(e.toString());

        log("Failed to add user: $e");
      }
    }
  }

  //!Edit note
  Future<void> editNotes(NotesModel note) async {
    if (formKey.currentState!.validate()) {
      state = EditNoteLoading();
      log("AddNoteLoading");

      try {
        await notes.doc().update({
          "title": note.title,
          "sub_title": note.color,
          "color": note.color,
        });
        state = EditNoteSuccess();

        log("Note edit Successfully");
      } catch (e) {
        state = EditNoteError(e.toString());

        log("Failed to edit user: $e");
      }
    }
  }

  //!Delete note
  Future<void> deleteNote({required String path}) async {
    try {
      await notes.doc(path).delete();
      log("======Delete Successfully======");
    } catch (e) {
      log(e.toString());
    }
  }
}

//!Get note
final getNotesProvider = FutureProvider<List<NotesModel>>((ref) async {
  final notes = await FirebaseFirestore.instance
      .collection('notes')
      .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      .get();

  return notes.docs.map((e) => NotesModel.fromJson(e)).toList();
});

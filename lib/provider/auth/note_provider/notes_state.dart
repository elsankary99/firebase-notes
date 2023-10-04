part of 'notes_provider.dart';

abstract class NotesState {
  const NotesState();
}

class NotesInitial extends NotesState {}

//? Add note
class AddNoteLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class AddNoteError extends NotesState {
  final String message;
  const AddNoteError(this.message);
}

//? Edit note
class EditNoteLoading extends NotesState {}

class EditNoteSuccess extends NotesState {}

class EditNoteError extends NotesState {
  final String message;
  const EditNoteError(this.message);
}

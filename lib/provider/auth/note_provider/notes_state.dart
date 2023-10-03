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

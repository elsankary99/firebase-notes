part of 'notes_provider.dart';

abstract class NotesState {
  const NotesState();
}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesDataFetched extends NotesState {}

class NotesError extends NotesState {
  final String message;
  const NotesError(this.message);
}

part of 'add_notes_cubit.dart';

@immutable
sealed class AddNotesState {}

final class NotesInitial extends AddNotesState {}
final class AddNoteSucess extends AddNotesState {}
final class AddNotesfail extends AddNotesState {
  final String errorMsg;

  AddNotesfail({required this.errorMsg});
  
}
final class AddNotesLoading extends AddNotesState {}

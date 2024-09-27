part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesCubitInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSucess extends NotesState {
final  List<NoteViewModel> notes;

  NotesSucess({required this.notes});

}

final class NotesFail extends NotesState {
  final String errorMsg;

  NotesFail({required this.errorMsg});
}

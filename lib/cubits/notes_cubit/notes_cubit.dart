import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_view_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesCubitInitial());
  List<NoteViewModel>? notes;

  fetchAllNote() async {
    try {
      var noteBox = Hive.box<NoteViewModel>(kNoteBox);
       notes = noteBox.values.toList();
      emit(NotesSucess(notes: notes!));
    } on Exception catch (e) {
      emit(NotesFail(errorMsg: e.toString()));
      // TODO
    }
  }
}

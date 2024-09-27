import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_view_model.dart';

part 'add_notes_state.dart';

class AddNoteCubit extends Cubit<AddNotesState> {
  AddNoteCubit() : super(NotesInitial());
 Color color = Color(0xff1F5673);
  addNote(NoteViewModel note) async {
    note.color = color.value;
    var notesBox = Hive.box<NoteViewModel>(kNoteBox);
    (kNoteBox);
    emit(AddNotesLoading());
    try {
      await notesBox.add(note);
      emit(AddNoteSucess());
    } catch (e) {
      emit(AddNotesfail(errorMsg: e.toString()));
    }
  }
}

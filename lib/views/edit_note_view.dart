import 'package:flutter/material.dart';
import 'package:note_app/Widgets/edit_note_view_body.dart';
import 'package:note_app/models/note_view_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key,required this.note});
  final NoteViewModel note;
  static String id = 'EditNoteView';
  @override
  Widget build(BuildContext context) {
    return  EditNoteViewBody(note: note,);
  }
}

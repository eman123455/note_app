import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Widgets/custom_note_item.dart';

import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_view_model.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteViewModel> notes =
            BlocProvider.of<NotesCubit>(context).notes??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListView.builder(
             itemCount: notes.length,
              padding:const  EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const  EdgeInsets.symmetric(vertical: 4),
                  child: CustomNoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}

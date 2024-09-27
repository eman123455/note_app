import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_view_model.dart';
import 'package:note_app/simple_bloc_observer.dart';
import 'package:note_app/views/edit_note_view.dart';
import 'package:note_app/views/notes_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteViewModelAdapter());
  await Hive.openBox<NoteViewModel>(kNoteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        routes: {NotesView.id: (context) => const NotesView()},
        onGenerateRoute: (settings) {
          if (settings.name == EditNoteView.id) {
            final note = settings.arguments as NoteViewModel;
            return MaterialPageRoute(
              builder: (context) => EditNoteView(
                note: note,
              ),
            );
          }
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins', brightness: Brightness.dark),
        initialRoute: NotesView.id,
      ),
    );
  }
}

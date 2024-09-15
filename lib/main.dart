import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
// import 'package:hive/hive.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notess_app/Cubits/add_note_cubit.dart';
import 'package:notess_app/constants/konstants.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/simple_bloc_observer.dart';
import 'package:notess_app/views/notes%20view.dart';

void main()async {
  await Hive.initFlutter();


  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(KNotesBox);

  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins'
      ),
      home: const Notesview(),

    );
  }
}

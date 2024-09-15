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
  await Hive.openBox(KNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AddNoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins'
        ),
        home: const Notesview(),
      
      ),
    );
  }
}

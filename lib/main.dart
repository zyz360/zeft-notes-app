import 'package:flutter/material.dart';
import 'package:notess_app/views/notes%20view.dart';

void main() {
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

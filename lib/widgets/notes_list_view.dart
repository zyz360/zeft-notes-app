import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/Cubits/notes_cubit.dart';
import 'package:notess_app/models/note_model.dart';

import 'custom_note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit,NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes! ;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: ListView.builder(
            itemCount:notes.length ,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteCard(
                    note: notes[index],
                  ),
                );
              }
          ),
        );
      },
    );
  }
}


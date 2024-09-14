
import 'package:flutter/material.dart';

import 'custom_note_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      child: ListView.builder(itemBuilder: (context,index)
      {
        return const Padding(
          padding:  EdgeInsets.symmetric(vertical: 4),
          child:  NoteCard(),
        );
      }
      ),
    );
  }
}


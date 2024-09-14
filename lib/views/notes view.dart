import 'package:flutter/material.dart';
import 'package:notess_app/widgets/add_note_bottom_sheet.dart';

import '../widgets/notes_view_body.dart';

class Notesview extends StatelessWidget {
  const Notesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
              context: context,
              builder: (context){
            return AddNoteBottomSheet();
          });
        },
        
        child: Icon(Icons.add),),
      body: const NotesViewBody(),
    );
  }
}


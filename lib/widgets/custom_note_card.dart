
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/Cubits/notes_cubit.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return EditNoteView(
            note: note,
          );
        }
        ));
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 18,
            bottom: 18,
            left: 16
        ),
      
      
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
      
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end ,
          //why the above line only move-ed the date text widget only? to the end?
          children: [
            ListTile(
              title:  Text(
                note.title,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
      
      
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                 note.Subtitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 18,
                  ),
                ),
              ),
      
      
              trailing: IconButton(
                onPressed: (){
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(Icons.delete,
                  color: Colors.black,
                  size: 30 ,
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(note.Date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



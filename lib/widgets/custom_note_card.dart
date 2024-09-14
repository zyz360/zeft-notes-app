
import 'package:flutter/material.dart';
import 'package:notess_app/widgets/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return EditNoteView();
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
          color: Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16),
        ),
      
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end ,
          //why the above line only move-ed the date text widget only? to the end?
          children: [
            ListTile(
              title: const Text(
                "flutter tips",
                style: TextStyle(
                    color: Colors.black
                ),
              ),
      
      
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Sample text for test',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontSize: 18,
                  ),
                ),
              ),
      
      
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.delete,
                  color: Colors.black,
                  size: 30 ,
                ),
              ),
            ),
      
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text('13 september / 2024',
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



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/custom_app_bar.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.note});
 final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(
            title: 'Edit note',
            icon: Icons.check,
          ),
          SizedBox(height: 50,),
          CustomTextField(hint: 'title '),
          SizedBox(height: 16,),
          CustomTextField(hint: 'Content',maxLines: 5,)
        ],
      ),
    );
  }
}

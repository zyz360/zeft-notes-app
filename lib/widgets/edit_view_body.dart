import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/Cubits/notes_cubit.dart';
import 'package:notess_app/models/note_model.dart';
import 'package:notess_app/widgets/custom_app_bar.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
 final NoteModel note;


  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(
            onPressed: (){
              widget.note.title = title ?? widget.note.title;
              widget.note.Subtitle = content ?? widget.note.Subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit note',
            icon: Icons.check,
          ),
          SizedBox(height: 50,),
          CustomTextField(
            onChanged: (value){
              title = value;
            },
              hint: widget.note.title),
          SizedBox(height: 16,),
          CustomTextField(
            onChanged: (value){
              content = value;
            },
            hint:widget.note.Subtitle,maxLines: 5,)
        ],
      ),
    );
  }
}

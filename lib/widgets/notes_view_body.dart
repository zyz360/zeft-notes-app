
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notess_app/Cubits/notes_cubit.dart';

import 'custom_app_bar.dart';
import 'custom_note_card.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState(){
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children:const [
          SizedBox(
            height: 50,
          ),
           CustomAppBar(title: 'Notes', icon: Icons.search,),
          Expanded(
              child: NotesListView()),
        ],
      ),
    );
  }
}

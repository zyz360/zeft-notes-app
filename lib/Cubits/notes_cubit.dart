import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notess_app/models/note_model.dart';

import '../constants/konstants.dart';

part 'notes_state.dart';

class  NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async
  {
      var notesBox  = Hive.box<NoteModel>(KNotesBox);

   notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}

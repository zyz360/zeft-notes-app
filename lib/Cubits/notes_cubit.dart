import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notess_app/models/note_model.dart';

import '../constants/konstants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() async
  {

    try {
      var notesBox  = Hive.box<NoteModel>(KNotesBox);

      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    }catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}

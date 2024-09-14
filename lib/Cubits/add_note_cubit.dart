import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notess_app/constants/konstants.dart';
import 'package:notess_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note)async {
    emit(AddNoteLoading());
   try {
     var notesBox  = Hive.box<NoteModel>(KNotesBox);
     emit(AddNoteSuccess());
     await notesBox.add(note);
   }catch (e) {
     AddNoteFailure(e.toString());
   }
   // add<String>('abc');
  }
  //
  // T add<T>(T name)
  // {
  //   return name;
  // }
}

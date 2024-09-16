import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notess_app/Cubits/add_note_cubit.dart';
import 'package:notess_app/models/note_model.dart';

import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
final GlobalKey<FormState> formkey = GlobalKey();

class _AddNoteFormState extends State<AddNoteForm> {
  String ? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'title',
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'content',
            maxLines: 5,
          ),
          SizedBox(
            height: 32,
          ),
          ColorsListView(),
          SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(

                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDAte = DateFormat('dd-mm-yyyy').format(currentDate);
                    var noteModel = NoteModel(title: title!,
                        Subtitle: subTitle!,
                        Date: formattedCurrentDAte,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}





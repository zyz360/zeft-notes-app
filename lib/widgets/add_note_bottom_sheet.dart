import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notess_app/Cubits/add_note_cubit.dart';
import 'package:notess_app/constants/konstants.dart';
import 'package:notess_app/widgets/custom_text_field.dart';

import 'add_note_form.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if(state is AddNoteFailure)
          {
            print('failed ${state.errMessage}');
          }
          if(state is AddNoteSuccess)
          {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                  child: AddNoteForm(),
              ),
          );
        },
      ),
    );
  }
}

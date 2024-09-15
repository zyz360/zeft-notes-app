import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notess_app/Cubits/add_note_cubit.dart';
// import 'package:notess_app/constants/konstants.dart';
// import 'package:notess_app/widgets/custom_text_field.dart';
//
import 'add_note_form.dart';
// import 'custom_button.dart';

// class AddNoteBottomSheet extends StatelessWidget {
//   const AddNoteBottomSheet({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddNoteCubit(),
//       child: BlocConsumer<AddNoteCubit, AddNoteState>(
//         listener: (context, state) {
//           if (state is AddNoteFailure) {
//             print('failed ${state.errMessage}');
//           }
//           if (state is AddNoteSuccess) {
//             Navigator.pop(context);
//           }
//         },
//         builder: (context, state) {
//
//           return AbsorbPointer(
//             absorbing: state is AddNoteLoading ? true : false,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16.0,right: 16,
//                   bottom: MediaQuery.of(context).viewInsets.bottom),
//               child: SingleChildScrollView(
//                 child: AddNoteForm(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('failed ${state.errMessage}');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Builder(
              builder: (BuildContext innerContext) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: MediaQuery.of(innerContext).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: AddNoteForm(),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

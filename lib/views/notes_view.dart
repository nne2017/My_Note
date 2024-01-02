import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/cubits/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:my_note_app/views/widgets/add_note_botton_sheet.dart';
import 'package:my_note_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubitCubit(),
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true, //to make bottom sheet up the keyboard
                context: context,
                builder: (context) {
                  return const AddNoteButtonSheet();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

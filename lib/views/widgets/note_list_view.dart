import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/cubits/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:my_note_app/models/note_model.dart';
import 'package:my_note_app/views/widgets/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubitCubit, NotesCubitState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubitCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}

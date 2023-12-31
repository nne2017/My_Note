import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/cubits/cubit/notes_cubit/notes_cubit_cubit.dart';
import 'package:my_note_app/views/widgets/custom_appbar.dart';
import 'package:my_note_app/views/widgets/note_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubitCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 60),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search_rounded,
          ),
          Expanded(
            child: NoteListView(),
          ),
        ],
      ),
    );
  }
}

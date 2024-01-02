import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_note_app/constants.dart';
import 'package:my_note_app/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());

  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
  }
}

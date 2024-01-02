import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note_app/cubits/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:my_note_app/models/note_model.dart';
import 'package:my_note_app/views/widgets/custom_button.dart';
import 'package:my_note_app/views/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 42,
          ),
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subTitle!,
                        date: DateTime.now().toString(),
                        color: Colors.blueGrey.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

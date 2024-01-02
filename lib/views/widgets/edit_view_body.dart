import 'package:flutter/material.dart';
import 'package:my_note_app/views/widgets/custom_appbar.dart';
import 'package:my_note_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
            height: 60,
          ),
          CustomTextField(hintText: 'Title'),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            hintText: 'Content',
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

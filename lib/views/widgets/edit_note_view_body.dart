import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../models/note_model.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          children: [
            CustomAppBar(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = title ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                text: 'Edit Note',
                icon: Icons.check),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
                onChanged: (value) => title = value,
                hints: widget.note.title),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
                onChanged: (value) => subTitle = value,
                hints: widget.note.subTitle,
                maxLines: 7),
          ],
        ),
      ),
    );
  }
}

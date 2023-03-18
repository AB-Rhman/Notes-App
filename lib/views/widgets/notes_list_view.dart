import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'custom_note_item.dart';
import 'empty_note_list_body.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes !;
        return notes.isEmpty ? const EmptyNotesListWidget() : ListView.builder(
          itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (ctx, index) {
              return  Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: NoteItem(
                   note: notes[index],
                ),
              );
            });
      },
    );
  }
}


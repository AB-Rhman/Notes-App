import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return  EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 24)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Text(note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7), fontSize: 16)),
              ),
              trailing: IconButton(
                  onPressed: () {
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.bottomSlide,
                      dialogType: DialogType.warning,
                      title: 'Are you sure you want \n to delete this note !',
                      btnCancelOnPress: () {
                       BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      btnCancelText: 'Keep',
                      btnOkText: 'Delete',
                      btnCancelColor: kPrimaryColor,
                      btnOkColor: Colors.red,
                      btnOkOnPress: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },

                    ).show();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 28,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7), fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

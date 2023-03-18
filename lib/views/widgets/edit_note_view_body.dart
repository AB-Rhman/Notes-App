import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'colors_list_view.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                  onPressed: () {

                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.noHeader,
                      buttonsBorderRadius: BorderRadius.circular(4),
                     dialogBorderRadius: BorderRadius.circular(11) ,
                      title: 'Save Edit ??',
                      btnCancelOnPress: () {
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      },
                      btnCancelText: 'Cancel',
                      btnOkText: 'Ok',
                      btnOkOnPress: () {
                        widget.note.title = title ?? widget.note.title;
                        widget.note.subTitle = title ?? widget.note.subTitle;
                        widget.note.save();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        Navigator.pop(context);
                      },

                    ).show();
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
              const SizedBox(
                height: 16,
              ),
              EditNoteColorsList(note: widget.note ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({Key? key, required this.note}) : super(key: key);

  final NoteModel note ;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;

  @override
  void initState() {

    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = colors[index].value;
                setState(() {

                });
              },
              child: ColorItem(
                color: colors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}

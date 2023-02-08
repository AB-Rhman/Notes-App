import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          children: const [
            CustomAppBar(text: 'Notes',icon: Icons.search),
            SizedBox(height: 11),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}


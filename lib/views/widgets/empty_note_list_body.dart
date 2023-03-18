import 'package:flutter/material.dart';

class EmptyNotesListWidget extends StatelessWidget {
  const EmptyNotesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/NoteListEmpty.png'),
          Image.asset('assets/images/createTest.png'),
        ],
      ),
    );
  }
}

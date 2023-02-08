import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'custom_bottom.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 32,
            ),
            CustomTextField(
              hints: 'title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(hints: 'content', maxLines: 6),
            SizedBox(height: 64,),
            CustomBottom(),
            SizedBox(height: 14,)
          ],
        ),
      ),
    );
  }
}


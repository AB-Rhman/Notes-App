import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, required this.icon}) : super(key: key);

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
        Spacer(),
        CustomSearchIcon(icon: icon),
      ],
    );
  }
}


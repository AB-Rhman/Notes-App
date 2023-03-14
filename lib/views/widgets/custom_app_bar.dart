import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, required this.icon, this.onPressed}) : super(key: key);

  final String text;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Text(
          text,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomSearchIcon(icon: icon,onPressed: onPressed,),
      ],
    );
  }
}


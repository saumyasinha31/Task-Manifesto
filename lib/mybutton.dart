import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key,
  required this.text,
  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
    color: Theme.of(context).primaryColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Specify the radius here
      ),
    child: Text(text,
    style: TextStyle(
      color: Colors.white,
    ),),);
  }
}

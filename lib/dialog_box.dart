import 'package:flutter/material.dart';
import 'package:todo/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key,
  required this.controller,
  required this.onCancel,
  required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      // add dialogue
      content: Container(height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //here ill get user input
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              fillColor: Colors.teal[100],
              filled: true,
              hintText: "Add new task!",

            ),
          ),

           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // here ll be save button
                 MyButton(text: "Save", onPressed: onSave),
                   SizedBox(width: 10,),
                // here ll be back/cancel button

                MyButton(text: "Cancel", onPressed: onCancel
                ),

              ],
            ),

          //buttons: save and back
        ],
      ),),
    );
  }
}

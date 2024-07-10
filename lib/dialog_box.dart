import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      // add dialogue
      content: Container(height: 200,
      child: Column(
        children: [
          //here ill get user input
          TextField(
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
            children: [
              // here ll be save button
               

              // here ll be back/cancel button
            ],
          )
          //buttons: save and back
        ],
      ),),
    );
  }
}

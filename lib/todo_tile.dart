import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({

  super.key,
  required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
    required this.deleteFunction,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, right : 19 , top:19, bottom: 9.5),
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),

        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade200),

            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged: onChanged),
                Text(taskName,
                style: TextStyle(
                  fontSize: 16,
                  decoration:taskCompleted? TextDecoration.lineThrough : TextDecoration.none
                ),),
          
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
          
          ),
        ),

      ),
    );

  }
}

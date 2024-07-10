
import 'package:todo/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List toDoList=[
    ["DSA" , false],
    ["Do Exercise" , false],
    
  ];
  void checkBoxChanged(bool ?value , int index){
  setState(() {
    toDoList[index][1]= !toDoList[index][1];
    //setting the state opposite of what we currently have
  });
}

// creating a new task
void createNewTask() {
  showDialog(
      context: context,
      builder: (context) {
        return DialogBox();
      }
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.teal[200],
      appBar: AppBar(
        elevation: 8.0,
        title:  Center(

          child: Text('Task Manifesto',
          style: TextStyle(
            fontSize: 24,

            color: Colors.white,
            fontWeight: FontWeight.bold,

          ),
          ),

    ),
        backgroundColor: Colors.teal[800],
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: createNewTask,
        child:Icon(Icons.add),

    ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value)=>checkBoxChanged(value , index),
          );
        },
      )
    );

  }
}

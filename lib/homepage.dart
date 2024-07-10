import 'package:todo/data/database.dart';
import 'package:todo/data/database.dart';
import 'package:todo/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:todo/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   //reference the hive box
   final _myBox = Hive.box('mybox');

   ToDoDataBase db = ToDoDataBase();


   @override
   void initState(){
      // if im opening app for first time , it ll create default data
     if(_myBox.get("TODOLIST")== null){
       db.createInitialData();
     }else{
       // data already exist in database
       db.loadData();
     }
     super.initState();
   }
  // creating my text controller
  final _controller = TextEditingController();

  void checkBoxChanged(bool ?value , int index){
  setState(() {
    db.toDoList[index][1]= !db.toDoList[index][1];
    //setting the state opposite of what we currently have
  });
  db.updateDatabase();
}

//deleting a task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
//saving new task

  void saveNewTask(){
    setState(() {
      db.toDoList.add([
        _controller.text, false
      ]

      );
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }
// creating a new task
void createNewTask() {
  showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            deleteFunction: (context) => deleteTask(index),
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value)=>checkBoxChanged(value , index),
          );
        },
      )
    );

  }
}

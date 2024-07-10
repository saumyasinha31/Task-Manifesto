import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];

  //referencing my box
  final _myBox = Hive.box('mybox');


  // it ll work if im opening the app first time ever
     void  createInitialData() {
       toDoList = [
         ["Task Name ", false],
         ["Task Name ", false],
       ];
     }
    //loading data from database
      void loadData(){
      toDoList = _myBox.get("TODOLIST");
      //TODOLIST is key under which data of todolist is saved in database

     }

    //updating hive database

    void updateDatabase(){
   _myBox.put("TODOLIST", toDoList);
    }
  }

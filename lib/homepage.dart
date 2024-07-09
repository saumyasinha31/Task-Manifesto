import 'package:flutter/material.dart';
import 'package:todo/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.yellow[200],
      appBar: AppBar(
        elevation: 8.0,
        title:  Center(

          child: Text('TO DO',
          style: TextStyle(
            fontSize: 24,

            color: Colors.white,
            fontWeight: FontWeight.bold,

          ),
          ),

    ),
        backgroundColor: Colors.grey[600],
      ),

      body: ListView(
        children: [
          ToDoTile(
            taskName: "DSA",
            taskCompleted: true,
            onChanged: (p0){

            },
          ),

        ],
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todoey/models/task.dart';
import 'package:flutter_todo_app/todoey/models/tasks.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
                ),
                TextField(
                  onChanged: (value) => newTaskTitle = value,
                  autofocus: true,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    tasks.addTask(Task(name: newTaskTitle));
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

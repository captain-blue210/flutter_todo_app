import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todoey/models/tasks.dart';
import 'package:flutter_todo_app/todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = tasks.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                tasks.updateTask(task);
              },
              longPressCallback: () {
                tasks.deleteTask(task);
              },
            );
          },
          itemCount: tasks.tasks.length,
        );
      },
    );
  }
}

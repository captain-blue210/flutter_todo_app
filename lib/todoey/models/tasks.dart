import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_app/todoey/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'test1'),
    Task(name: 'test2'),
    Task(name: 'test3'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(Task aTask) {
    _tasks.add(aTask);
    notifyListeners();
  }

  void deleteTask(Task aTask) {
    _tasks.remove(aTask);
    notifyListeners();
  }

  void updateTask(Task aTask) {
    aTask.toggleDone();
    notifyListeners();
  }
}

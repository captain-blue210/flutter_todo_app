import 'package:flutter/material.dart';
import 'package:flutter_todo_app/task_logic.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final addTaskController = TextEditingController();
  late FocusNode addTaskFocusNode;

  @override
  void initState() {
    super.initState();
    addTaskFocusNode = FocusNode();
  }

  @override
  void dispose() {
    addTaskController.dispose();
    addTaskFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 12),
        child: TextField(
          onEditingComplete: () async {
            if (addTaskController.text.isNotEmpty) {
              await TaskLogic.add(addTaskController.text);
            }
            addTaskController.clear();
            addTaskFocusNode.unfocus();
          },
          controller: addTaskController,
          focusNode: addTaskFocusNode,
          decoration: const InputDecoration(
            prefixIcon: const Icon(
              Icons.add_circle,
            ),
            hintText: 'Add a Task',
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.black54)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}

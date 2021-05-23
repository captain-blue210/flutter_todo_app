import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String _taskName = '';
  final Status _status = Status.doing;

  final addTaskController = TextEditingController();

  @override
  void dispose() {
    addTaskController.dispose();
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
            setState(() => {_taskName = addTaskController.text});
            await add();
            addTaskController.clear();
            FocusScope.of(context).requestFocus(FocusNode());
          },
          controller: addTaskController,
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

  Future add() async {
    final collection = FirebaseFirestore.instance.collection('tasks');
    await collection.add(<String, dynamic>{
      'taskName': _taskName,
      'status': _status.toString().split('.')[1],
      'createdAt': Timestamp.now(),
    });
  }
}

enum Status { doing, done }

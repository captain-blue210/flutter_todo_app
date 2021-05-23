import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/add_task.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: buildTaskList(),
    );
  }

  Widget buildTaskList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('tasks')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return ListView(
          children: snapshot.data!.docs.map((e) {
            return Card(
              child: ListTile(
                leading: IconButton(
                  icon: e['status'] == Status.doing.toString().split('.')[1]
                      ? const Icon(Icons.check_box_outline_blank)
                      : const Icon(Icons.check_box),
                  onPressed: () {
                    toggle(e);
                  },
                ),
                title: Text('${e['taskName']}'),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> toggle(QueryDocumentSnapshot<Object?> doc) async {
    return FirebaseFirestore.instance
        .collection('tasks')
        .doc(doc.id)
        .update(<String, String>{
      'status':
          doc['status'].toString() == Status.doing.toString().split('.')[1]
              ? Status.done.toString().split('.')[1]
              : Status.doing.toString().split('.')[1]
    });
  }
}

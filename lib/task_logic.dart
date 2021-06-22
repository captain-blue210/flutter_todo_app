import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo_app/Status.dart';

class TaskLogic {
  static Future<void> add(String taskName) async {
    final collection = FirebaseFirestore.instance.collection('tasks');
    await collection.add(<String, dynamic>{
      'taskName': taskName,
      'status': statusToString(Status.doing),
      'createdAt': Timestamp.now(),
    });
  }

  static Future<void> toggle(String docId) async {
    final taskRef = FirebaseFirestore.instance.collection('tasks').doc(docId);
    final DocumentSnapshot task = await taskRef.get();
    taskRef.update(
      <String, String>{
        'status': task['status'].toString() == statusToString(Status.doing)
            ? statusToString(Status.done)
            : statusToString(Status.doing)
      },
    );
  }

  static String statusToString(Status status) {
    switch (status) {
      case Status.doing:
        return 'DOING';
      case Status.done:
        return 'DONE';
    }
  }

  static Future<void> delete(String docId) async {
    FirebaseFirestore.instance.collection('tasks').doc(docId).delete();
  }
}

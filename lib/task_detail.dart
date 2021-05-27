import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Status.dart';
import 'package:flutter_todo_app/task_logic.dart';
import 'package:intl/intl.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail(this.docId);
  final String docId;

  @override
  State<StatefulWidget> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: buildContents(widget.docId),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContents(String docId) {
    return StreamBuilder<DocumentSnapshot>(
      stream:
          FirebaseFirestore.instance.collection('tasks').doc(docId).snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: const CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ListView(
                  children: [
                    ListTile(
                      leading: IconButton(
                        icon: snapshot.data!['status'].toString() ==
                                TaskLogic.statusToString(Status.doing)
                            ? const Icon(Icons.check_box_outline_blank)
                            : const Icon(Icons.check_box),
                        onPressed: () {
                          TaskLogic.toggle(widget.docId);
                        },
                      ),
                      title: Text(
                        snapshot.data!['taskName'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      '''作成日:${DateFormat('yyyy年MM月dd日').format((snapshot.data!['createdAt'] as Timestamp).toDate())}''',
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        TaskLogic.delete(docId);
                      },
                      icon: const Icon(Icons.delete),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

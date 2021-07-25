import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  bool isChecked = false;
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(isChecked, (bool? checkboxState) {
        setState(() {
          isChecked = checkboxState!;
        });
      }),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkBoxState;
  final ValueChanged<bool?>? toggleCheckboxState;

  TaskCheckbox(this.checkBoxState, this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}

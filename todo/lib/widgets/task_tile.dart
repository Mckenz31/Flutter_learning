import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String name;
  final Function statusChange;

  TaskTile({this.isChecked, this.name, this.statusChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$name',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough: null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: statusChange,
      ),
    );
  }
}
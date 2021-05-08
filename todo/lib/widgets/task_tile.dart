import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String name;
  final Function statusChange;
  final Function removeOne;

  TaskTile({this.isChecked,@required this.name, this.statusChange, this.removeOne});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: removeOne,
      title: Text(
        name,
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
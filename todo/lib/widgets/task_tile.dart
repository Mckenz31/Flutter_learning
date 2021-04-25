import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  TaskTile({this.text, this.status});

  final String text;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$text'),
      trailing: Checkbox(
        value: status,
      ),
    );
  }
}

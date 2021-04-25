import 'package:flutter/material.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      children: [
        TaskTile(text: 'Finish learning flutter', status: false,),
        TaskTile(text: 'Dance practice', status: true,),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todo/models/task.dart';

class TaskList extends StatefulWidget {

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [
    Task(name: 'Finish learning flutter', isChecked: false),
    Task(name: 'Submit the report', isChecked: false),
    Task(name: 'Ensure that attendance is availed', isChecked: false),
    Task(name: 'Chill out', isChecked: false),
    Task(name: 'Make a plan', isChecked: false)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return TaskTile(
        name: tasks[index].name,
        isChecked: tasks[index].isChecked,
        statusChange: (checkboxState){
          setState(() {
            tasks[index].toggle();
          },);
        },
      );
    },
    itemCount: tasks.length,);
  }
}
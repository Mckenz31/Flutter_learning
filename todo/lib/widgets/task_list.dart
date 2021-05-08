import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child){
        return ListView.builder(itemBuilder: (context, index){
          return TaskTile(
            name: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isChecked,
            statusChange: (checkboxState){
              taskData.changeState(taskData.tasks[index]);
            },
            removeOne: (){
              taskData.removeTask(index);
            },
          );
        },
          itemCount: taskData.tasks.length,);
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/models/taskModel.dart';

String name;

class AddTask extends StatelessWidget {
  @override

  final Function addATask;

  AddTask(this.addATask);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'New Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontSize:25,
            ),
          ),
          SizedBox(width: 10, height: 20.0,),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            cursorColor: Colors.redAccent,
            onChanged: (value) {
              name = value;
            }
          ),
          SizedBox(width: 10, height: 20.0,),
          TextButton(
            onPressed: (){
              Provider.of<TaskData>(context, listen: false).addTask(name);
              Navigator.pop(context);
            },
            child: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent,
            ),
          ),
       ],
      ),
    );
  }
}

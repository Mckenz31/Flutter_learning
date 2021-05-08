import 'package:flutter/foundation.dart';
import 'taskModel.dart';

class TaskData extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(name: 'Finish learning flutter', isChecked: false),
    TaskModel(name: 'Submit the report', isChecked: false),
    TaskModel(name: 'Ensure that attendance is availed', isChecked: false),
    TaskModel(name: 'Chill out', isChecked: false),
    TaskModel(name: 'Make a plan', isChecked: false)
  ];

  void addTask(String newValue){
    tasks.add(TaskModel(name: newValue));
    notifyListeners();
  }

  void changeState(TaskModel taskModel){
    taskModel.toggle();
    notifyListeners();
  }

  void removeTask(int index){
    tasks.removeAt(index);
    notifyListeners();
  }
}
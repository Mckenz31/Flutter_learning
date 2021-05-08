import 'package:flutter/cupertino.dart';

class TaskModel{

  final String name;
  bool isChecked = false;

  TaskModel({@required this.name, this.isChecked});

  void toggle(){
    isChecked = !isChecked;
  }
}
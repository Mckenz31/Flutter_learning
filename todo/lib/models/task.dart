import 'package:flutter/cupertino.dart';

class Task{

  final String name;
  bool isChecked;

  Task({@required this.name, @required this.isChecked});

  void toggle(){
    isChecked = !isChecked;
  }
}
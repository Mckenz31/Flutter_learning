import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/tasks.dart';
import 'models/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
              ),
            )
        ),
        debugShowCheckedModeBanner: false,
        home: Tasks(),
      ),
    );
  }
}

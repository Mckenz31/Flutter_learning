import 'package:flutter/material.dart';
import 'package:todo/screens/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Changed the underline color for the text field in the modal
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
            ),
          )
      ),
      debugShowCheckedModeBanner: false,
      home: Tasks(),
    );
  }
}

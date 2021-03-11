import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Ask me anything'),
          ),
        ),
        body: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ball_number = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            ball_number = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$ball_number.png'),
      ),
    );
  }
}




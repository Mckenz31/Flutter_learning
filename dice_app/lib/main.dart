import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(
          child: Text('Dice'),
        ),
      ),
      body: Dices(),
    ),
  ));
}

class Dices extends StatefulWidget {
  @override
  _DicesState createState() => _DicesState();
}

class _DicesState extends State<Dices> {
  int leftBtnClick = 1;
  int rightBtnClick = 1;

  //Function that changes the values of the dices
  changeDice(){
    setState(() {
      leftBtnClick = Random().nextInt(6) + 1;
      rightBtnClick = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: (){
                changeDice();
              },
              child: Image.asset('images/dice$leftBtnClick.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: (){
                changeDice();
              },
              child: Image.asset('images/dice$rightBtnClick.png'),
            ),
          ),
        ],
      ),
    );
  }
}
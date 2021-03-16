import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: QuizApp(),
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List<Icon> score = [];

  List<String> questions = [
    'You are an amazing person',
    'A cat has 3 legs',
    'Brazil is the 2nd biggest country in the entire world',
    'SriLanka is located in South Asia'
  ];

  List<bool> answers = [
    true,
    false,
    false,
    true
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

      Expanded(
        flex: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              questions[questionNumber],
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: 25.0,
            color: Colors.white,
            ),
          ),
        ),
        ),
      ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(answers[questionNumber] == true){
                    score.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }
                  else{
                    score.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  questionNumber++;

                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(answers[questionNumber] == false){
                    score.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  }
                  else{
                    score.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                  questionNumber++;
                //The user picked true.
                },);
              }
            ),
          ),
        ),
        Row(
          children: score,
        )
      ],
    );
  }
}


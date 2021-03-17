import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  QuestionLists questionList = QuestionLists();

  void checkAnswer(bool userAnswer) {
    setState(() {
      //Checking if it's the correct answer
      if(questionList.isFinished() == true){
        questionList.reset();
        score = [];
        Alert(
          context: context,
          title: "COMPLETED",
          desc: "You did a great job",
          buttons: [
            DialogButton(
              child: Text(
                "DONE"
              ),
              onPressed: () => Navigator.pop(context),
            )
          ]
        ).show();
        // Alert(
        //   context: context,
        //   type: AlertType.error,
        //   title: "COMPLETED",
        //   desc: "You did a great job",
        //   buttons: [
        //     DialogButton(
        //       child: Text(
        //         "DONE",
        //         style: TextStyle(color: Colors.white, fontSize: 20),
        //       ),
        //       onPressed: (){
        //         setState(() {
        //           Navigator.pop(context);
        //           score = [];
        //         });
        //       },
        //       width: 120,
        //     ),
        //   ],
        // ).show();
      }
      else{
        bool answer = userAnswer;
        if(questionList.getAnswer() == answer){
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
        questionList.updateQueNumber();
        //The user picked true.
      }
    });
  }

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
              questionList.getQuestion(),
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
                checkAnswer(true);
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
                checkAnswer(false);
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


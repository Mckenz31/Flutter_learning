import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/uicard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.status, @required this.result, @required this.comment});

  final String status;
  final String result;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kResultTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: UICard(
              colour: kActiveExpandedWidgetColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      status,
                      style: kResultStatusStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      result,
                      style: kResultStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      comment,
                      style: kResultCommentStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              text: 'RE-CALCULATE',
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'CardIconDeets.dart';
import 'uicard.dart';

const bottomContainerButton = 70.0;
const Color activeExpandedWidgetColor = Color(0xFF1D1E33);
const Color inactiveExpandedWidgetColor = Color(0xFF111328);
const Color bottomContainerColor = Colors.red;

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("BMI CALCULATOR"),
          )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: UICard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? activeExpandedWidgetColor: inactiveExpandedWidgetColor,
                    cardChild: CardIconDeets(
                        iconz: FontAwesomeIcons.male,
                        textz: 'Male'
                    ),
                  ),
                ),
                Expanded(
                  child: UICard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? activeExpandedWidgetColor: inactiveExpandedWidgetColor,
                    cardChild: CardIconDeets(
                        iconz: FontAwesomeIcons.female,
                        textz: "Female"
                    ),
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: UICard(
              colour: activeExpandedWidgetColor
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: UICard(
                      colour: activeExpandedWidgetColor,
                    ),
                  ),
                  Expanded(
                    child: UICard(
                      colour: activeExpandedWidgetColor,
                    ),
                  ),
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: bottomContainerColor,
            height: bottomContainerButton,
            width: double.infinity,
          ),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


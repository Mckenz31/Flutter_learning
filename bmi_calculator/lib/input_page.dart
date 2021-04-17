import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'CardIconDeets.dart';
import 'uicard.dart';
import 'constants.dart';

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
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("BMI CALCULATOR"),
          )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    colour: selectedGender == Gender.male ? kActiveExpandedWidgetColor: kInactiveExpandedWidgetColor,
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
                    colour: selectedGender == Gender.female ? kActiveExpandedWidgetColor: kInactiveExpandedWidgetColor,
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
              colour: kActiveExpandedWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberLabelStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 70,
                      max: 230,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: UICard(
                      colour: kActiveExpandedWidgetColor,
                    ),
                  ),
                  Expanded(
                    child: UICard(
                      colour: kActiveExpandedWidgetColor,
                    ),
                  ),
                ],
              ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: kBottomContainerColor,
            height: kBottomContainerButton,
            width: double.infinity,
          ),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


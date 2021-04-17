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
  int weight = 50;
  int age = 24;

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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconWidget(
                                iconSign: FontAwesomeIcons.minus,
                                updateWeightOnPress: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                  width: 10.0,
                              ),
                              RoundIconWidget(
                                iconSign: FontAwesomeIcons.plus,
                                updateWeightOnPress: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: UICard(
                      colour: kActiveExpandedWidgetColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconWidget(
                                iconSign: FontAwesomeIcons.minus,
                                updateWeightOnPress: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconWidget(
                                iconSign: FontAwesomeIcons.plus,
                                updateWeightOnPress: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
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

class RoundIconWidget extends StatelessWidget {

  RoundIconWidget({@required this.iconSign, @required this.updateWeightOnPress});

  final IconData iconSign;
  final Function updateWeightOnPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: updateWeightOnPress,
      shape: CircleBorder(),
      child: Icon(iconSign),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0
      ),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

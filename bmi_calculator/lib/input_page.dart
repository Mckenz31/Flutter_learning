import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

const bottomContainerButton = 70.0;
const Color activeExpandedWidgetColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Colors.red;

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

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
                    colour: activeExpandedWidgetColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            color: Color(0xFF8D8E98),
                            fontSize: 18.0
                          ),
                        )
                      ],
                    ),
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

class UICard extends StatelessWidget {
  UICard({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}

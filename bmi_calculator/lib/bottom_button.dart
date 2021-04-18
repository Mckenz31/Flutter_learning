import 'package:flutter/material.dart';
import 'constants.dart';

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
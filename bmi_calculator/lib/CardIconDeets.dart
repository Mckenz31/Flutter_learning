import 'package:flutter/material.dart';
import 'constants.dart';

class CardIconDeets extends StatelessWidget {

  CardIconDeets({@required this.iconz,@required this.textz});

  final IconData iconz;
  final String textz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconz,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textz,
          style: kLabelStyle,
        )
      ],
    );
  }
}


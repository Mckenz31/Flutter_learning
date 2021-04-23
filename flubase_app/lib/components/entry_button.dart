import 'package:flutter/material.dart';
import 'package:flubase_app/pages/welcome_screen.dart';
import 'package:flubase_app/pages/login_screen.dart';
import 'package:flubase_app/pages/registration_screen.dart';

class EntryButton extends StatelessWidget {

  EntryButton({@required this.buttonFunction, this.colour, @required this.textData});

  final Function buttonFunction;
  final Color colour;
  final String textData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: buttonFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$textData',
          ),
        ),
      ),
    );
  }
}
import 'package:flubase_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flubase_app/components/entry_button.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'fireLogo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
                decoration: kTextField.copyWith(
                    hintText: 'Enter your email'
                )
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextField.copyWith(
                hintText: 'Enter your password'
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            EntryButton(
              buttonFunction: (){},
              colour: Colors.lightBlueAccent,
              textData: 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
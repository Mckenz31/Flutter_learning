import 'package:flubase_app/constants.dart';
import 'package:flubase_app/pages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flubase_app/components/entry_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Padding(
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
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                textAlign: TextAlign.center,
                decoration: kTextField.copyWith(
                    hintText: 'Enter your email'
                )
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
                decoration: kTextField.copyWith(
                  hintText: 'Enter your password'
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              EntryButton(
                buttonFunction: () async {
                  setState(() {
                    spinner = true;
                  });
                  try{
                    final signedIn = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(signedIn != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      spinner = false;
                    });
                  }
                  catch (e) {
                    print(e);
                  }
                },
                colour: Colors.lightBlueAccent,
                textData: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

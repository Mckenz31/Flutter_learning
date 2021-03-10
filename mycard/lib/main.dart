import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/linkedIn.jfif'),
              ),
              Text(
                'Mckenzie Lionel Joseph Prince',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'DancingScript-VariableFont_wght',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'UNDERCOVER AGENT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  fontFamily: 'Oswald',
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                width: 200.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.add_call,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    '+77-93465411665',
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: ListTile(
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.email,
                    color: Colors.blueAccent,
                  ),
                  title: Text(
                    'undercover@undercover.com',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  Expanded expanded(Color color, int n1){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: color
        ),
        onPressed: (){
          final audioPlayer = AudioCache();
          audioPlayer.play('note$n1.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              expanded(Colors.red,1),
              expanded(Colors.blue,2),
              expanded(Colors.teal,3),
              expanded(Colors.yellow,4),
              expanded(Colors.purple,5),
              expanded(Colors.pink,6),
              expanded(Colors.brown,7)
            ],
          ),
        ),
      ),
    );
  }
}

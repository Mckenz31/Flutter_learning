import 'package:bitcoin_tracker/loading.dart';
import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.redAccent,
          scaffoldBackgroundColor: Colors.white),
      home: LoadingPage(),
    );
  }
}

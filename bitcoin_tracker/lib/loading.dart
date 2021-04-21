import 'package:bitcoin_tracker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String url = '';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return PriceScreen(
              currencyData: decodedData,
            );
          },
        ),
      );
    }
    else{
      print(response.statusCode);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.redAccent,
          size: 50.0,
        ),
      ),
    );
  }
}

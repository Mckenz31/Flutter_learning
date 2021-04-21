import 'package:flutter/material.dart';
import 'weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String check = 'hi';

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var data = await weatherModel.getGeoLocation();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            weatherData: data,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location{

  double latitiude;
  double longitude;

  Future<void> getCurrentLocation () async{
    try{
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitiude = position.latitude;
      longitude = position.longitude;
    }
    catch(e){
      print(e);
    }
  }
}


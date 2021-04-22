import 'package:bitcoin_tracker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'networking.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    getData();
  }
  
  getData() async{
    Networking network = Networking();
    var currencySet = await network.getCurrencyData();
    var BTCdata = currencySet[0];
    var ETHdata = currencySet[1];
    var LTCdata = currencySet[2];
    if(BTCdata != null && ETHdata != null && LTCdata != null){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context){
            return PriceScreen(
              BTCcurrencyData: BTCdata, ETHCurrencyData: ETHdata, LTCCurrencyData: LTCdata,
            );
          },
        ),
      );
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

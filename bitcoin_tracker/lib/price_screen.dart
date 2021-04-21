import 'package:flutter/material.dart';
import 'coin_dart.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
// import 'loading.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();

  PriceScreen({this.currencyData});

  final currencyData;
}

class _PriceScreenState extends State<PriceScreen> {
  String initialOption = 'USD';

  Text currencyValue(){
    var currency = widget.currencyData['rate'].toInt();
    return Text(
      '1 BTC = $currency USD',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> currencyName = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      currencyName.add(newItem);
    }
    return DropdownButton<String>(
      value: initialOption,
      items: currencyName,
      onChanged: (value) {
        setState(() {
          initialOption = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];

    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }

    return CupertinoPicker(
      backgroundColor: Colors.redAccent,
      itemExtent: 30.0,
      onSelectedItemChanged: (selectedIndex) {},
      children: pickerItems,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.redAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: currencyValue(),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.redAccent,
            child: Platform.isAndroid ? androidPicker() : iOSPicker(),
          ),
        ],
      ),
    );
  }
}

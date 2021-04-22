import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking{

  String bitCoin = 'BTC';
  String bitCoin1 = 'ETH';
  String bitCoin2 = 'LTC';
  String currency = 'USD';
  String apiKey = 'ENTER YOUR API KEY FROM CoinAPI.io';
  var decodedBTCData;
  var decodedETHData;
  var decodedLTCData;

  //BitCoin
  Future<dynamic> getCurrencyData() async {
    http.Response response = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoin/$currency?apikey=$apiKey'),
    );
    http.Response response1 = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoin1/$currency?apikey=$apiKey'),
    );
    http.Response response2 = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoin2/$currency?apikey=$apiKey'),
    );

    var currencySet = [];
    if(response.statusCode == 200 && response1.statusCode == 200 && response2.statusCode == 200){
      String data = response.body;
      String data1 = response1.body;
      String data2 = response2.body;
      decodedETHData = jsonDecode(data1);
      decodedBTCData = jsonDecode(data);
      decodedLTCData = jsonDecode(data2);
      currencySet.add(decodedBTCData);
      currencySet.add(decodedETHData);
      currencySet.add(decodedLTCData);
    }
    else{
      print(response.statusCode);
    }
    return currencySet;
  }

  Future<dynamic> getSelectedCurrencyData(selectedCurrency) async {
    currency = selectedCurrency;
    http.Response response = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoin/$currency?apikey=$apiKey'),
    );
    http.Response response1 = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoin1/$currency?apikey=$apiKey'),
    );
    http.Response response2 = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/$bitCoin2/$currency?apikey=$apiKey'),
    );

    var currencies =[];

    if(response.statusCode == 200  && response1.statusCode == 200 && response2.statusCode == 200){
      String data = response.body;
      String data1 = response1.body;
      String data2 = response2.body;
      decodedETHData = jsonDecode(data1);
      decodedBTCData = jsonDecode(data);
      decodedLTCData = jsonDecode(data2);
      currencies.add(decodedBTCData);
      currencies.add(decodedETHData);
      currencies.add(decodedLTCData);
    }
    else{
      print(response.statusCode);
    }
    return currencies;
  }

}
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'coin_data.dart';


class ExchangeData {
  Future<dynamic> getExchangeData(String selectedCurrency) async {
    Map<String, String> exchangeList = {};
    for(String crypto in cryptoList){
      String requestURL = '$apiURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);
      if(response.statusCode == 200){
        var decodeData = jsonDecode(response.body);
        exchangeList[crypto] = decodeData['rate'].toStringAsFixed(0);
      }else{
        print(response.statusCode);
        throw 'problem getting request';
      }
    }
    return exchangeList;
  }   
}

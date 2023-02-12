import 'dart:convert';
import 'package:flutter_app/tools/apikey.dart';
import 'package:http/http.dart' as Http;

const url = 'https://rest.coinapi.io/v1/exchangerate/BTC';

class Network {
  Future getData(currency) async{
    var response = await Http.get(Uri.parse('$url/$currency?apikey=$apikey'));
    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return response.statusCode;
    }

  }
}
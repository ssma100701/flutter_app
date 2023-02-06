import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {


  Future getData(url) async{
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return response.statusCode;
    }
  }



}
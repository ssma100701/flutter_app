import 'package:flutter/material.dart';
import 'package:flutter_app/screens/location_screen.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '2ca973d034e40daa307522cdc15b114e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lon;
  double? lat;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    lon = location.longitude;
    lat = location.latitude;
    getData();
  }

  void getData() async {
    NetworkHelper networkHelper = NetworkHelper();

    var weatherData = await networkHelper.getData(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(locationWeather: weatherData)));

    // String name = weatherData['name'];
    // int condition = weatherData['weather'][0]['id'];
    // double temperature = weatherData['main']['temp'];
    //
    // print(name);
    // print(condition);
    // print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}

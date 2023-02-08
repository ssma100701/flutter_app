import '../services/networking.dart';
import '../services/location.dart';

const apiKey = '2ca973d034e40daa307522cdc15b114e';
const openWeatherMapURL ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  NetworkHelper networkHelper = NetworkHelper();
  Future<dynamic> getCityWeatherData(String cityName) async {
    var weatherData = await networkHelper.getData(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    return weatherData;
  }

  Future<dynamic> getCurrentWeatherData() async{
    Location location = Location();
    await location.getCurrentLocation();



    var weatherData = await networkHelper.getData(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

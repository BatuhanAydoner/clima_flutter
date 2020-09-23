import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const API_KEY = "369920e6a4faa905f93aeb6f145a305f";
const OPENWEATHERMAP_URL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  double latitude; // current latitude
  double longitude; // current longitude

  // Get data with location from api.
  Future<dynamic> getLocationWeather() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();

      latitude = location.latitude;
      longitude = location.longitude;

      NetworkHelper networkHelper = NetworkHelper(
          "$OPENWEATHERMAP_URL?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric");

      var data = await networkHelper.getData();
      return data;
    } catch (e) {
      print(e);
    }
  }

  // Get data with city name from api.
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "$OPENWEATHERMAP_URL?q=$cityName&appid=$API_KEY&units=metric");
    var data = networkHelper.getData();
    return data;
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

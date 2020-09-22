import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude; // current latitude
  double longitude; // current longitude

  // Get current lat and lon and send a request.
  void getLocationData() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      latitude = location.latitude;
      longitude = location.longitude;

      NetworkHelper networkHelper = NetworkHelper(
          "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=369920e6a4faa905f93aeb6f145a305f");

      var weatherData = await networkHelper.getData();

      print(weatherData);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude; // current latitude
  double longitude; // current longitude

  // Get current lat and lon and send a request.
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var locationWeather = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: locationWeather,
      );
    }));
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
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.grey,
          size: 50.0,
        ),
      ),
    );
  }
}

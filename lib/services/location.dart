import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  // Get user's current location.
  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    } catch (e) {
      print(e);
    }
    latitude = position.latitude;
    longitude = position.longitude;
  }
}

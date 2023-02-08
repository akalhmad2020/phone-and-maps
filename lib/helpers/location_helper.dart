
import 'package:geolocator/geolocator.dart';

class LocationHelper {

  static Future<Position> determineCurrentLocation() async{
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if(isLocationServiceEnabled){
      await Geolocator.requestPermission();
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
  }


}
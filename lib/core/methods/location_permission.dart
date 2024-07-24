import 'package:permission_handler/permission_handler.dart';

class LocationPermission {
  static getLocationPermission() async {
    bool permission = await Permission.locationWhenInUse.isDenied;
    if (permission) {
      Permission.locationWhenInUse.request();
    }
  }
}

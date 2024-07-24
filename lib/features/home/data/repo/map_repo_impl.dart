import 'dart:ffi';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_app_customer/features/home/data/repo/map_repo.dart';

class MapRepoImpl implements MapRepo {
  @override
  Future<LatLng> getCurrentLiveUserLocation() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    return LatLng(currentLocation.latitude, currentLocation.longitude);
  }

  @override
  Future<Void> changeMapTheme() {
    // TODO: implement changeMapTheme
    throw UnimplementedError();
  }
}

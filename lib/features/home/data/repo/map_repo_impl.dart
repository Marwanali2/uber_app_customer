import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_app_customer/features/home/data/repo/map_repo.dart';

class MapRepoImpl implements MapRepo {
  @override
  Future<void> changeMapTheme(
      BuildContext context, GoogleMapController controller) async {
    var mapNightStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/json/map_dark_theme.json');
    setMapStyle(controller, mapNightStyle);
  }

  setMapStyle(GoogleMapController controller, String mapStyle) {
    controller.setMapStyle(mapStyle);
  }

  @override
  Future<void> getCurrentLiveUserLocation(
      GoogleMapController controller) async {
    Position currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    animateCameraToCurrentLocation(controller, currentLocation);
  }
}

animateCameraToCurrentLocation(
    GoogleMapController controller, Position position) {
  controller.animateCamera(
    CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(
          position.latitude,
          position.longitude,
        ),
        zoom: 15,
      ),
    ),
  );
}

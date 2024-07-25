import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapRepo {
  Future<void> getCurrentLiveUserLocation(GoogleMapController controller);
  Future<void> changeMapTheme(
      BuildContext context, GoogleMapController controller);
}

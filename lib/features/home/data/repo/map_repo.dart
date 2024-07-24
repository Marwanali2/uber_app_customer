import 'dart:ffi';

import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapRepo {
  Future<LatLng> getCurrentLiveUserLocation();
  Future<Void> changeMapTheme();
}

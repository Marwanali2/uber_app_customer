import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_app_customer/features/home/data/repo/map_repo.dart';

import '../../../../../core/network/constants.dart';
import '../../../data/repo/map_repo_impl.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});
  static MapRepo mapRepo = MapRepoImpl();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: Constants.initPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        mapRepo.getCurrentLiveUserLocation(controller);
        mapRepo.changeMapTheme(context, controller);
      },
    );
  }
}

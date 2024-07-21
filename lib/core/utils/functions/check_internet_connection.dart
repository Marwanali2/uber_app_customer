import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:uber_app_customer/core/widgets/app_custom_snackbar.dart';

class AppMethods {
  static Future<bool> checkInternetConnection(BuildContext context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile &&
        connectivityResult != ConnectivityResult.wifi) {
      if (!context.mounted) return false;
      displayAppCustomSnackBar(
          'Please connect to Wi-Fi for optimal performance.', context);
      return false;
    } else {
      return true;
    }
  }
}

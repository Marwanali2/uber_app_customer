import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class Internet {
  static Future<bool> checkInternetConnection() async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        return true;
      } else {
        return false;
      }
    } on SocketException {
      return false;
    }
  }
}

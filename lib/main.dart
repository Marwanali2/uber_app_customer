import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'uber_customer_app.dart';

void main() {
  
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const UberCustomerApp(), 
  ),
);
}

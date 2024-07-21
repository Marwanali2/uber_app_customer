import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'uber_customer_app.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const UberCustomerApp(), 
  ),
);
}

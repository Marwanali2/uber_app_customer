import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/uber_app_customer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // This will Fix the issue of screenUtils in Realse Mode
  await ScreenUtil.ensureScreenSize();
  runApp(const UberAppCustomer());
}

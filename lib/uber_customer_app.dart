import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/core/routing/app_router.dart';

class UberCustomerApp extends StatelessWidget {
  const UberCustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
         useInheritedMediaQuery: true,
      //locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          title: 'Uber Customer App',
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
          ),
        ));
  }
}

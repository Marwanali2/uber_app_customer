import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/core/routing/app_router.dart';

import 'core/styles/app_theme.dart';

class UberCustomerApp extends StatelessWidget {
  const UberCustomerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          title: 'Uber Customer App',
          theme: AppTheme.lightTheme,
        ));
  }
}

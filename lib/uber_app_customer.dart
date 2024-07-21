import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/features/authentication/data/repo/firebase_authentication_impl.dart';
import 'package:uber_app_customer/features/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'package:uber_app_customer/features/authentication/presentation/view/login_screen.dart';

import 'core/styles/app_theme.dart';

class UberAppCustomer extends StatelessWidget {
  const UberAppCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => LoginCubit(FirebaseAuthenticationImpl()),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}

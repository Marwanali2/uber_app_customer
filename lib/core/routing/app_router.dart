import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_app_customer/core/routing/routes.dart';
import 'package:uber_app_customer/features/authentication/presentation/view/signup_screen.dart';
import 'package:uber_app_customer/features/home/presentation/view/home_scree.dart';

import '../../features/authentication/data/repo/firebase_authentication_impl.dart';
import '../../features/authentication/presentation/controller/login_cubit/login_cubit.dart';
import '../../features/authentication/presentation/controller/signup_cubit/sign_up_cubit.dart';
import '../../features/authentication/presentation/view/login_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
      path: Routes.loginSCreen,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(FirebaseAuthenticationImpl()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
        path: Routes.signUpScreen,
        builder: (context, state) => BlocProvider(
              create: (context) => SignUpCubit(FirebaseAuthenticationImpl()),
              child: const SignUpScreen(),
            )),
    GoRoute(
      path: Routes.homeScreen,
      builder: (context, state) => const HomeScreen(),
    )
  ]);
}

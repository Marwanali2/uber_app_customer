import 'package:go_router/go_router.dart';
import 'package:uber_app_customer/core/routing/routes.dart';
import 'package:uber_app_customer/features/authentication/Presentation/managers/login_cubit/login_cubit.dart';
import 'package:uber_app_customer/features/authentication/Presentation/managers/signup_cubit/sign_up_cubit.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/login_view.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/signup_view.dart';
import 'package:uber_app_customer/features/authentication/data/repo/firebase_authentication_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.kMain,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(FirebaseAuthenticationImpl()),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: Routes.kLogin,
        builder: (context, state) => BlocProvider(
         create: (context) => LoginCubit(FirebaseAuthenticationImpl()),
          child: const LoginView(),
        ),
      ),
    ],
  );
}

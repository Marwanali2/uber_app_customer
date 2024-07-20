import 'package:go_router/go_router.dart';
import 'package:uber_app_customer/core/routing/routes.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/login_view.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/signup_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.kMain,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: Routes.kLogin,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.kSignUp,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}

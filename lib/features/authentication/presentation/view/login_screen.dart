import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:uber_app_customer/core/styles/app_styles.dart';

import '../../../../core/helpers/app_spaces.dart';
import '../../../../core/methods/app_notifier.dart';
import '../../../../core/methods/internet_connection.dart';
import '../../../../core/widgets/custom_app_button.dart';
import 'signup_screen.dart';
import 'widgets/login_text_fields.dart';
import 'widgets/logo_and_authentication_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      // This will unfocus the keyboard when user taps anywhere on the screen.
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoAndAuthenticationText(
                  text: 'Login As a User',
                ),
                verticalSpace(20),
                const LoginTextFields(),
                verticalSpace(15),
                CustomAppButton(
                  onPressed: () async {
                    var connected = await Internet.checkInternetConnection();
                    if (connected) {
                    } else {
                      if (context.mounted) {
                        appNotifier(
                            context,
                            const CustomSnackBar.error(
                                message: 'Check Your Internet Connection'));
                      }
                    }
                  },
                  text: 'Login',
                  height: 43,
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: AppStyles.font14Bold.copyWith(
                            color: Colors.blue,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

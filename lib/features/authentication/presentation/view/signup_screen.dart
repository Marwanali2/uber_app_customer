import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:uber_app_customer/core/helpers/app_spaces.dart';
import 'package:uber_app_customer/core/methods/app_notifier.dart';
import 'package:uber_app_customer/core/methods/internet_connection.dart';
import 'package:uber_app_customer/features/authentication/presentation/view/widgets/sign_up_text_fields.dart';

import '../../../../core/styles/app_styles.dart';
import '../../../../core/widgets/custom_app_button.dart';
import '../controller/signup_cubit/sign_up_cubit.dart';
import 'login_screen.dart';
import 'widgets/logo_and_authentication_text.dart';
import 'widgets/signup_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  text: 'Create a User Account',
                ),
                verticalSpace(20),
                const SignUpTextFields(),
                verticalSpace(15),
                CustomAppButton(
                  onPressed: () async {
                    var connected = await Internet.checkInternetConnection();
                    if (connected) {
                      if (context.mounted) {
                        validateAndLogin(context);
                      }
                    } else {
                      if (context.mounted) {
                        appNotifier(
                            context,
                            const CustomSnackBar.error(
                                message: 'Check Your Internet Connection'));
                      }
                    }
                  },
                  text: 'Sign Up',
                  height: 43,
                ),
                verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text('Log In',
                            style: AppStyles.font14Bold.copyWith(
                              color: Colors.blue,
                            )))
                  ],
                ),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  validateAndLogin(BuildContext context) {
    BlocProvider.of<SignUpCubit>(context).doSignUp();
  }
}

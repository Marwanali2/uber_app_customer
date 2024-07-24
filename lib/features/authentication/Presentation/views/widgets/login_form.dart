import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_app_customer/core/routing/routes.dart';
import 'package:uber_app_customer/core/utils/validators.dart';
import 'package:uber_app_customer/features/authentication/Presentation/managers/login_cubit/login_cubit.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/widgets/custom_button.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
   bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = context.read<LoginCubit>().emailController;
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  String? validateEmail(String? value) {
    if (value == null || !value.isValidEmail) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || !value.isValidPassword) {
      return 'Please enter a valid password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          CustomTextField(
            label: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (String value) {},
            controller: emailController,
            validator: validateEmail,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03.h),
          CustomTextField(
            label: 'Password',
            hintText: 'Enter your password',
            keyboardType: TextInputType.visiblePassword,
            onFieldSubmitted: (String value) {},
            controller: passwordController,
            validator: validatePassword,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.03.h),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().doLogin();
              } else {}
            },
            text: 'Login',
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.07.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(Routes.kSignUp);
                },
                child: const Text('Sign up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

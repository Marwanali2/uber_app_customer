import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_app_customer/core/helpers/validators.dart';

import '../../../../../core/helpers/app_spaces.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../controller/login_cubit/login_cubit.dart';

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({super.key});

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
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

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppTextFormField(
          validator: (String? value) {
            if (value == null || !value.isValidEmail) {
              return 'Please enter a valid email';
            }
            return null;
          },
          controller: emailController,
          hintText: 'Email',
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.grey,
          )),
      verticalSpace(10),
      CustomAppTextFormField(
        validator: (String? value) {
          if (value == null || !value.isValidPassword) {
            return 'Please enter a valid password';
          }
          return null;
        },
        controller: passwordController,
        hintText: 'Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(obscureText ? Icons.visibility_off : Icons.remove_red_eye),
        ),
        obscureText: obscureText,
      )
    ]);
  }
}

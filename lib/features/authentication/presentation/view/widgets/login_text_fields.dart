import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_spaces.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';

class LoginTextFields extends StatefulWidget {
  const LoginTextFields({super.key});

  @override
  State<LoginTextFields> createState() => _LoginTextFieldsState();
}

class _LoginTextFieldsState extends State<LoginTextFields> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomAppTextFormField(
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey,
        ),
      ),
      verticalSpace(10),
      CustomAppTextFormField(
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

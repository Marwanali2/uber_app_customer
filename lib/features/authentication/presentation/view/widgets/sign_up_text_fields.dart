import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_spaces.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';

class SignUpTextFields extends StatefulWidget {
  const SignUpTextFields({super.key});

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const CustomAppTextFormField(
        hintText: 'User Name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
      verticalSpace(10),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_spaces.dart';
import '../../../../../core/widgets/custom_app_text_form_field.dart';
import '../../controller/cubit/sign_up_cubit.dart';

class SignUpTextFields extends StatefulWidget {
  const SignUpTextFields({super.key});

  @override
  State<SignUpTextFields> createState() => _SignUpTextFieldsState();
}

class _SignUpTextFieldsState extends State<SignUpTextFields> {
  bool obscureText = true;
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  initState() {
    userNameController = context.read<SignUpCubit>().userNameController;
    phoneController = context.read<SignUpCubit>().phoneController;
    emailController = context.read<SignUpCubit>().emailController;
    passwordController = context.read<SignUpCubit>().passwordController;
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppTextFormField(
        controller: userNameController,
        hintText: 'User Name',
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.grey,
        ),
      ),
      verticalSpace(10),
      CustomAppTextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        hintText: 'Phone',
        prefixIcon: const Icon(
          Icons.phone,
          color: Colors.grey,
        ),
      ),
      verticalSpace(10),
      CustomAppTextFormField(
        controller: emailController,
        hintText: 'Email',
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.grey,
        ),
      ),
      verticalSpace(10),
      CustomAppTextFormField(
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

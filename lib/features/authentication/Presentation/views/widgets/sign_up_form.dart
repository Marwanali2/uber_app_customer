import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:uber_app_customer/core/routing/routes.dart';
import 'package:uber_app_customer/core/utils/validators.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/widgets/custom_button.dart';
import 'package:uber_app_customer/features/authentication/Presentation/views/widgets/custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  String? validateName(String? value) {
    if (value == null || !value.isValidName) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || !value.isValidPhone) {
      return 'Please enter a valid phone number';
    }
    return null;
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

  String? validateConfirmPassword(String? value) {
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
            label: 'Full Name',
            hintText: 'Enter your full name',
            keyboardType: TextInputType.text,
            onFieldSubmitted: (String value) {},
            controller: fullNameController,
            validator: validateName,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            label: 'Phone Number',
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            onFieldSubmitted: (String value) {},
            controller: phoneNumberController,
            validator: validatePhone,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            label: 'Email',
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (String value) {},
            controller: emailController,
            validator: validateEmail,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            label: 'Password',
            hintText: 'Enter your password',
            keyboardType: TextInputType.visiblePassword,
            onFieldSubmitted: (String value) {},
            controller: passwordController,
            validator: validatePassword,
          ),
          SizedBox(height: 20.h),
          CustomTextField(
            label: 'Confirm Password',
            hintText: 'Confirm your password',
            keyboardType: TextInputType.visiblePassword,
            onFieldSubmitted: (String value) {},
            validator: validateConfirmPassword!,
          ),
          SizedBox(height: 30.h),
          CustomButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // Process the sign-up
              } else {
                // Show error message
              }
            },
            text: 'Sign Up',
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(Routes.kLogin);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

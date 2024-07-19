import 'package:flutter/material.dart';

import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return const SignUpViewBody();
  }
}

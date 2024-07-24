import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_app_customer/core/helpers/validators.dart';
import 'package:uber_app_customer/features/authentication/data/repo/authentication_repo.dart';

import '../../../data/models/login_request_body.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepo authenticationRepo;
  LoginCubit(this.authenticationRepo) : super(const LoginState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> doLogin() async {
    emit(const LoginState.loading());
    final result = await authenticationRepo.signIn(
      LoginRequestBody(
          email: emailController.text.trim(),
          password: passwordController.text.trim()),
    );

    result.fold(
      (l) => emit(LoginState.failure(l.error)),
      (r) => emit(const LoginState.success()),
    );
  }

// Login Email and Password Validators

  // String? validateEmail

  // String? validatePassword
}

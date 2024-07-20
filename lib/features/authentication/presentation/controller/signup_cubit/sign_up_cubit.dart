import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_app_customer/features/authentication/data/repo/authentication_repo.dart';

import '../../../data/models/signup_request_body.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepo authenticationRepo;
  SignUpCubit(this.authenticationRepo) : super(const SignUpState.initial());
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> doSignUp() async {
    emit(const SignUpState.loading());
    final result = await authenticationRepo.signUp(SignUpRequestBody(
        name: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text));
    result.fold(
      (l) => emit(SignUpState.failure(message: l.error)),
      (r) => emit(const SignUpState.success()),
    );
  }
}

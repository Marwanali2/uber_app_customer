import 'package:dartz/dartz.dart';
import 'package:uber_app_customer/core/network/error_handler.dart';
import 'package:uber_app_customer/features/authentication/data/models/login_request_body.dart';
import 'package:uber_app_customer/features/authentication/data/models/signup_request_body.dart';
abstract class AuthenticationRepo {
  Future<Either<ErrorHandler, void>> signUp(SignUpRequestBody signUpRequestBody);

  Future<Either<ErrorHandler, void>> signIn(LoginRequestBody loginRequestBody);
}
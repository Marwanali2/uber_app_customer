import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uber_app_customer/core/network/constants.dart';
import 'package:uber_app_customer/features/authentication/data/models/login_request_body.dart';
import 'package:uber_app_customer/features/authentication/data/repo/authentication_repo.dart';

import '../../../../core/network/error_handler.dart';
import '../models/signup_request_body.dart';

class FirebaseAuthenticationImpl implements AuthenticationRepo {
  @override
  Future<Either<ErrorHandler, void>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final User? user =
          (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpRequestBody.email,
        password: signUpRequestBody.password,
      ))
              .user;

      await addUserInformation(signUpRequestBody, user: user);
      await sendEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(error: e.message.toString()));
    } on FirebaseException catch (e) {
      return Left(ErrorHandler(error: e.message.toString()));
    } catch (e) {
      return Left(ErrorHandler(error: 'Something went wrong'));
    }
  }

  addUserInformation(SignUpRequestBody signUpRequestBody, {User? user}) async {
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child('users').child(user!.uid);
    await userRef.set(signUpRequestBody.toJson());
  }

  sendEmailVerification() async {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  @override
  Future<Either<ErrorHandler, void>> signIn(
      LoginRequestBody loginRequestBody) async {
    try {
      final User? user = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: loginRequestBody.email,
                  password: loginRequestBody.password))
          .user;
      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users').child(user!.uid);
      var value = await userRef.once();

      if (value.snapshot.value != null) {
        if ((value.snapshot.value as Map)['blockState'] == 'true') {
          Constants.userName = (value.snapshot.value as Map)['name'];
          FirebaseAuth.instance.signOut();
          return Left(ErrorHandler(error: 'This user is blocked'));
        } else if ((FirebaseAuth.instance.currentUser!.emailVerified) ==
            false) {
          return Left(ErrorHandler(
              error:
                  'Please verify your email, a link has been sent to your email'));
        } else {
          return const Right(null);
        }
      } else {
        FirebaseAuth.instance.signOut();
        return Left(
            ErrorHandler(error: 'This user does not exist our records'));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(error: e.message.toString()));
    } on FirebaseException catch (e) {
      return Left(ErrorHandler(error: e.message.toString()));
    }
  }
}

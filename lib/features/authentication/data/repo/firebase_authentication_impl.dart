import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child('users').child(user!.uid);
      userRef.set(signUpRequestBody.toJson());
      print(user.uid);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorHandler(error: e.message.toString()));
    } on FirebaseException catch (e) {
      return Left(ErrorHandler(error: e.message.toString()));
    } catch (e) {
      return Left(ErrorHandler(error: 'Something went wrong'));
    }
  }
}

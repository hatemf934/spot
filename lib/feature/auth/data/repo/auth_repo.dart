import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spot/core/error/auth_faliure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String userName,
    required String dateOfBirth,
    required String gender,
  });

  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword({
    required String identifier,
    required String password,
  });
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}

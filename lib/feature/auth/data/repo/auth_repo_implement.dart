import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spot/core/error/auth_faliure.dart';
import 'package:spot/core/utils/text_fireauth_manager.dart';
import 'package:spot/feature/auth/data/model/user_model.dart';
import 'package:spot/feature/auth/data/repo/auth_repo.dart';

class AuthRepoImplement extends AuthRepo {
  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String userName,
    required String dateOfBirth,
    required String gender,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        UserModel userModel = UserModel(
          fullName: fullName,
          userName: userName,
          phone: phone,
          email: email,
          dateOfBirth: dateOfBirth,
          gender: gender,
          uId: userCredential.user!.uid,
          password: password,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      }
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(message: TextFireauthManager.kAnErrorOccurred));
    }
  }
}

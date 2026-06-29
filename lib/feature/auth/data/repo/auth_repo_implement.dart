import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spot/constants.dart';
import 'package:spot/core/error/auth_faliure.dart';
import 'package:spot/core/services/fire_base_auth_services.dart';
import 'package:spot/core/services/fire_store_services.dart';
import 'package:spot/core/utils/text_fireauth_manager.dart';
import 'package:spot/feature/auth/data/model/user_model.dart';
import 'package:spot/feature/auth/data/repo/auth_repo.dart';

class AuthRepoImplement extends AuthRepo {
  final AuthFireBaseServices authFireBaseServices = AuthFireBaseServices();
  final FireStoreServices fireStoreServices = FireStoreServices();
  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String userName,
    required String dateOfBirth,
    required String gender,
  }) async {
    try {
      final userCredential = await authFireBaseServices
          .signUpWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
        fullName: fullName,
        userName: userName,
        phone: phone,
        email: email,
        dateOfBirth: dateOfBirth,
        gender: gender,
        uId: userCredential.uid,
        password: password,
      );

      await addUserData(user: userModel.toMap());

      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(message: TextFireauthManager.kAnErrorOccurred));
    }
  }

  Future<void> addUserData({required Map<String, dynamic> user}) {
    return fireStoreServices.addData(
      path: userCollection,
      data: user,
      documentId: user['uId'],
    );
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      email = email.trim();
      password = password.trim();
      final user = await authFireBaseServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      await getUserData(documentId: user.uid);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(message: TextFireauthManager.kAnErrorOccurred));
    }
  }

  Future<UserModel> getUserData({required String documentId}) async {
    var data = await fireStoreServices.getData(
      path: userCollection,
      documentId: documentId,
    );
    return UserModel.fromMap(data);
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      final GoogleSignInAccount account = await googleSignIn.authenticate(
        scopeHint: ['email'],
      );

      final GoogleSignInAuthentication auth = account.authentication;

      if (auth.idToken == null) {
        return Left(AuthFailure(message: TextFireauthManager.kAnErrorOccurred));
      }

      final credential = GoogleAuthProvider.credential(idToken: auth.idToken);
      return Right(
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((userCredential) => userCredential.user!),
      );
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailure.fromFirebaseAuthException(e));
    } catch (e) {
      return Left(AuthFailure(message: TextFireauthManager.kAnErrorOccurred));
    }
  }
}

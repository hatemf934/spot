import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spot/feature/auth/data/repo/auth_repo.dart';

part 'regester_state.dart';

class RegesterCubit extends Cubit<RegesterState> {
  RegesterCubit(this.authRepo) : super(RegesterInitial());
  final AuthRepo authRepo;
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    required String userName,
    required String dateOfBirth,
    required String gender,
  }) async {
    emit(SignupLoading());
    var result = await authRepo.signUpWithEmailAndPassword(
      email: email,
      password: password,
      fullName: fullName,
      phone: phone,
      userName: userName,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );

    result.fold(
      (failure) => emit(SignupFailure(errmessage: failure.message)),
      (userCredential) => emit(SignupSucsses(userCredential: userCredential)),
    );
  }
}

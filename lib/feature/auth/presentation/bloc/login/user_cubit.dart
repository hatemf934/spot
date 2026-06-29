import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:spot/feature/auth/data/repo/auth_repo.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;

  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();

  TextEditingController signUpFullName = TextEditingController();
  TextEditingController signUpUserName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController signUpGender = TextEditingController();
  TextEditingController signUpDateBrith = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(
      email: signInEmail.text,
      password: signInPassword.text,
    );
    result.fold(
      (failure) => emit(SignInFailure(errmessage: failure.message)),
      (user) => emit(SignInSucsses(user: user)),
    );
  }

  Future<void> signUpWithEmailAndPassword() async {
    emit(SignupLoading());
    var result = await authRepo.signUpWithEmailAndPassword(
      email: signUpEmail.text,
      password: signUpPassword.text,
      fullName: signUpFullName.text,
      phone: signUpPhoneNumber.text,
      userName: signUpUserName.text,
      dateOfBirth: signUpDateBrith.text,
      gender: signUpGender.text,
    );

    result.fold((failure) => emit(SignupFailure(errmessage: failure.message)), (
      user,
    ) {
      clearSignUpFields();
      emit(SignupSucsses(user: user));
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) => emit(SignInFailure(errmessage: failure.message)), (
      user,
    ) {
      clearSignInFields();
      emit(SignInSucsses(user: user));
    });
  }

  void clearSignUpFields() {
    signUpEmail.clear();
    signUpPassword.clear();
    signUpFullName.clear();
    signUpDateBrith.clear();
    signUpGender.clear();
    signUpPhoneNumber.clear();
    signUpUserName.clear();
  }

  void clearSignInFields() {
    signInEmail.clear();
    signInPassword.clear();
  }

  @override
  Future<void> close() {
    signInEmail.dispose();
    signInPassword.dispose();
    signUpFullName.dispose();
    signUpUserName.dispose();
    signUpPhoneNumber.dispose();
    signUpEmail.dispose();
    signUpPassword.dispose();
    signUpGender.dispose();
    signUpDateBrith.dispose();

    return super.close();
  }
}

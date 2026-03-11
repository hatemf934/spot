part of 'regester_cubit.dart';

@immutable
sealed class RegesterState {}

final class RegesterInitial extends RegesterState {}

final class SignupSucsses extends RegesterState {
  final UserCredential userCredential;
  SignupSucsses({required this.userCredential});
}

final class SignupFailure extends RegesterState {
  final String errmessage;

  SignupFailure({required this.errmessage});
}

final class SignupLoading extends RegesterState {}

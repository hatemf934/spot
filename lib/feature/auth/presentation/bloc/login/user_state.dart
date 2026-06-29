part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class LoginInitial extends UserState {}

final class SignInSucsses extends UserState {
  final User user;
  SignInSucsses({required this.user});
}

final class SignInFailure extends UserState {
  final String errmessage;

  SignInFailure({required this.errmessage});
}

final class SignInLoading extends UserState {}

final class SignupSucsses extends UserState {
  final User user;
  SignupSucsses({required this.user});
}

final class SignupFailure extends UserState {
  final String errmessage;

  SignupFailure({required this.errmessage});
}

final class SignupLoading extends UserState {}

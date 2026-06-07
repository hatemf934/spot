part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class SignInSucsses extends LoginState {
  final User user;
  SignInSucsses({required this.user});
}

final class SignInFailure extends LoginState {
  final String errmessage;

  SignInFailure({required this.errmessage});
}

final class SignInLoading extends LoginState {}

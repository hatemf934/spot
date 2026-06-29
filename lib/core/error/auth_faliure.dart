import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class AuthFailure extends Failure {
  AuthFailure({required super.message});
  factory AuthFailure.fromFirebaseAuthException(
    FirebaseAuthException authError,
  ) {
    switch (authError.code) {
      case 'email-already-in-use':
        return AuthFailure(
          message: 'This email is already registered. Try logging in instead.',
        );
      case 'invalid-email':
        return AuthFailure(message: 'Please enter a valid email address.');
      case 'operation-not-allowed':
        return AuthFailure(
          message:
              'This sign-in method is not enabled. Please contact support.',
        );
      case 'weak-password':
        return AuthFailure(
          message:
              'Password is too weak. Use at least 8 characters with letters and numbers.',
        );
      case 'user-disabled':
        return AuthFailure(
          message: 'Your account has been suspended. Please contact support.',
        );
      case 'user-not-found':
        return AuthFailure(
          message:
              'No account found with this email. Would you like to sign up?',
        );
      case 'wrong-password':
        return AuthFailure(
          message:
              'Incorrect password. Please try again or reset your password.',
        );
      case 'too-many-requests':
        return AuthFailure(
          message:
              'Too many failed attempts. Please wait a few minutes and try again.',
        );
      case 'network-request-failed':
        return AuthFailure(
          message:
              'No internet connection. Please check your network and try again.',
        );
      case 'invalid-credential':
        return AuthFailure(
          message:
              'Incorrect email or password. Please check your details and try again.',
        );
      default:
        return AuthFailure(
          message: 'Something went wrong. Please try again later.',
        );
    }
  }
}

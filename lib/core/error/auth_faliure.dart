import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class AuthFailure extends Failure {
  final bool isCancelled;
  AuthFailure({required super.message, this.isCancelled = false});

  factory AuthFailure.fromFirebaseAuthException(
    FirebaseAuthException authError,
  ) {
    switch (authError.code) {
      case 'email-already-in-use':
        return AuthFailure(
          message: 'The email address is already in use by another account.',
        );
      case 'invalid-email':
        return AuthFailure(message: 'The email address is badly formatted.');
      case 'operation-not-allowed':
        return AuthFailure(
          message: 'This operation is not allowed. Contact support.',
        );
      case 'weak-password':
        return AuthFailure(
          message: 'The password is too weak. Choose a stronger password.',
        );
      case 'user-disabled':
        return AuthFailure(
          message: 'This user has been disabled. Contact support.',
        );
      case 'user-not-found':
        return AuthFailure(message: 'No user found with this email address.');
      case 'wrong-password':
        return AuthFailure(message: 'Wrong password. Please try again.');
      case 'too-many-requests':
        return AuthFailure(message: 'Too many requests. Try again later.');
      case 'network-request-failed':
        return AuthFailure(
          message: 'Network error. Check your internet connection.',
        );
      case 'invalid-credential':
        return AuthFailure(
          message: 'The login information is incorrect or expired.',
        );
      default:
        return AuthFailure(
          message: 'Authentication failed: ${authError.message}',
        );
    }
  }
}

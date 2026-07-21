import 'dart:async';
import 'faliure.dart';

class GeneralFailure extends Failure {
  final bool _canRetry;

  const GeneralFailure({
    required super.message,
    required super.userMessage,
    bool canRetry = true,
  }) : _canRetry = canRetry;

  @override
  bool get canRetry => _canRetry;

  factory GeneralFailure.fromException(dynamic error) {
    if (error is TimeoutException) {
      return const GeneralFailure(
        message: "TimeoutException occurred.",
        userMessage: "Connection timed out, please try again.",
      );
    }

    if (error is TypeError) {
      return const GeneralFailure(
        message: "TypeError — data casting failed.",
        userMessage: "Something went wrong while processing the data.",
        canRetry: false,
      );
    }

    if (error is FormatException) {
      return const GeneralFailure(
        message: "FormatException — JSON parsing failed.",
        userMessage: "Something went wrong while processing the data.",
        canRetry: false,
      );
    }

    final errorText = error.toString();

    if (errorText.contains('Unable to load asset')) {
      return const GeneralFailure(
        message: "Unable to load asset.",
        userMessage: "Some content couldn't be loaded.",
        canRetry: false,
      );
    }

    return GeneralFailure(
      message: "Unexpected error: $errorText",
      userMessage: "An unexpected error occurred, please try again.",
    );
  }
}

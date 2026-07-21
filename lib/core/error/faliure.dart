abstract class Failure {
  final String message;
  final String userMessage;
  final int? statusCode;

  const Failure({
    required this.message,
    required this.userMessage,
    this.statusCode,
  });

  bool get canRetry => true;
}

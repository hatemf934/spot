import 'package:dio/dio.dart';
import 'faliure.dart';

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.userMessage,
    super.statusCode,
  });

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionError:
        return const ServerFailure(
          message: "DioExceptionType.connectionError",
          userMessage: "No internet connection, please check your settings.",
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          message: "DioExceptionType.timeout",
          userMessage: "Connection timed out, please try again.",
        );
      case DioExceptionType.cancel:
        return const ServerFailure(
          message: "DioExceptionType.cancel",
          userMessage: "Request was cancelled, please try again.",
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return const ServerFailure(
            message: "SocketException — no internet",
            userMessage: "No internet connection, please check your settings.",
          );
        }
        return const ServerFailure(
          message: "DioExceptionType.unknown",
          userMessage: "Something went wrong, please try again.",
        );
      default:
        return const ServerFailure(
          message: "DioException unknown type",
          userMessage: "Something went wrong, please try again.",
        );
    }
  }

  static ServerFailure _handleBadResponse(int? statusCode, dynamic data) {
    String? serverMessage;
    if (data is Map<String, dynamic>) {
      final msg = data['message'] ?? data['ErrorMessage'] ?? data['error'];
      if (msg is List) {
        serverMessage = msg.first as String;
      } else if (msg is String) {
        serverMessage = msg;
      }
    }
    return switch (statusCode) {
      400 => ServerFailure(
        message: "Bad request. statusCode: 400",
        userMessage: serverMessage ?? "Something went wrong, please try again.",
        statusCode: 400,
      ),
      401 => ServerFailure(
        message: "Unauthorized. statusCode: 401",
        userMessage:
            serverMessage ?? "Your session expired, please login again.",
        statusCode: 401,
      ),
      403 => ServerFailure(
        message: "Forbidden. statusCode: 403",
        userMessage: serverMessage ?? "You don't have access to this content.",
        statusCode: 403,
      ),
      404 => ServerFailure(
        message: "Not found. statusCode: 404",
        userMessage: serverMessage ?? "Content not found.",
        statusCode: 404,
      ),
      500 => ServerFailure(
        message: "Internal server error. statusCode: 500",
        userMessage:
            serverMessage ?? "Server is having issues, please try later.",
        statusCode: 500,
      ),
      503 => ServerFailure(
        message: "Service unavailable. statusCode: 503",
        userMessage:
            serverMessage ?? "Service is temporarily down, please try later.",
        statusCode: 503,
      ),
      _ => ServerFailure(
        message: "Unknown error. statusCode: $statusCode",
        userMessage: serverMessage ?? "Something went wrong, please try again.",
        statusCode: statusCode,
      ),
    };
  }

  @override
  bool get canRetry => statusCode != 401 && statusCode != 403;
}

import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = "application/json";
    options.headers['X-Goog-Api-Key'] =
        "AIzaSyClLnwRpBHIx_AJxO0pdr9w2yydYsv2z8A";
    options.headers['X-Goog-FieldMask'] = "*";
    super.onRequest(options, handler);
  }
}

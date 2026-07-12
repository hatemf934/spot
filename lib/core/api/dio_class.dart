import 'package:dio/dio.dart';
import 'package:spot/core/api/api_Interceptors.dart';
import 'package:spot/core/api/api_class.dart';
import 'package:spot/core/api/end_points_class.dart';

class DioClass extends ApiClass {
  final Dio dio;

  DioClass({required this.dio}) {
    dio.options.baseUrl = EndPointClass.placeBaseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        requestUrl: true,
        responseBody: true,
        responseHeader: true,
        responseUrl: true,
      ),
    );
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameter,
  }) async {
    final response = await dio.get(
      path,
      data: data,
      queryParameters: queryparameter,
    );
    return response.data;
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryparameter,
    bool isFormData = false,
  }) async {
    final response = await dio.post(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryparameter,
    );
    return response.data;
  }
}

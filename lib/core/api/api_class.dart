abstract class ApiClass {
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameter,
  });
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryparameter,
    bool isFormData = false,
  });
}

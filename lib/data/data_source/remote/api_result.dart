import 'package:dio/dio.dart';

class ApiResult {
  final dynamic data;

  /// Contains the error message for the request
  final String? errorMessage;

  ApiResult({this.data}) : errorMessage = null;

  ApiResult.error({this.errorMessage}) : data = null;

  /// Returns true if the response has an error associated with it
  bool get hasError => errorMessage != null;
}

extension ResponseStatus on Response {
  dynamic responseData() {
    return data['data'];
  }

  bool isSuccess() {
    var success = data;
    return success['success'] == true;
  }

  String message() {
    var data = this.data;
    return data['message'] ?? statusMessage ?? '';
  }
}

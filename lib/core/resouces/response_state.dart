import 'package:dio/dio.dart';

abstract class ResponseState<T> {
  const ResponseState({this.data, this.error});

  final T? data;
  final DioException? error;
}

class SuccessfulResponse<T> extends ResponseState<T> {
  const SuccessfulResponse(T data) : super(data: data);
}

class FailedResponse<T> extends ResponseState<T> {
  const FailedResponse(DioException error) : super(error: error);
}

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseApiResponse<T> {
  @JsonKey(name: 'error_code')
  final String? errorCode;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final T? data;

  BaseApiResponse({
    this.errorCode,
    this.message,
    this.data,
  });
}

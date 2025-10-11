import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_api_response.g.dart';
part 'base_api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class BaseApiResponse<T> with _$BaseApiResponse<T> {
  const factory BaseApiResponse({
    @JsonKey(name: 'code') required int? code,
    @JsonKey(name: 'data') required T? data,
  }) = _BaseApiResponse<T>;

  factory BaseApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseApiResponseFromJson<T>(json, fromJsonT);
}

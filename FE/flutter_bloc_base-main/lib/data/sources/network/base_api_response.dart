import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_api_response.g.dart';
part 'base_api_response.freezed.dart';

Object? _readData(Map<dynamic, dynamic> json, String key) {
  if (json.containsKey('data')) {
    return json['data'];
  }

  final looksLikeEnvelope =
      json.containsKey('code') || json.containsKey('status') || json.containsKey('message');
  return looksLikeEnvelope ? null : json;
}

@Freezed(genericArgumentFactories: true)
class BaseApiResponse<T> with _$BaseApiResponse<T> {
  const factory BaseApiResponse({
    @JsonKey(name: 'code') required int? code,
    @JsonKey(name: 'data', readValue: _readData) required T? data,
  }) = _BaseApiResponse<T>;

  factory BaseApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseApiResponseFromJson<T>(json, fromJsonT);
}

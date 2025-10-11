import 'package:freezed_annotation/freezed_annotation.dart';
part 'page_response.g.dart';
part 'page_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
class PageResponse<T> with _$PageResponse<T> {
  const factory PageResponse({
    @JsonKey(name: 'items') required List<T> items,
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'pageSize') required int pageSize,
    @JsonKey(name: 'totalElements') required int totalElements,
    @JsonKey(name: 'totalPages') required int totalPages,
    @JsonKey(name: 'hasNext') required bool hasNext,
    @JsonKey(name: 'hasPrevious') required bool hasPrevious,
  }) = _PageResponse;

  factory PageResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PageResponseFromJson<T>(json, fromJsonT);
}

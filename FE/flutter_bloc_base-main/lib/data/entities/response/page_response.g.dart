// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageResponseImpl<T> _$$PageResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PageResponseImpl<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalItems: (json['totalElements'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      isLast: json['hasNext'] as bool,
      isFirst: json['hasPrevious'] as bool,
    );

Map<String, dynamic> _$$PageResponseImplToJson<T>(
  _$PageResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items?.map(toJsonT).toList(),
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalElements': instance.totalItems,
      'totalPages': instance.totalPages,
      'hasNext': instance.isLast,
      'hasPrevious': instance.isFirst,
    };

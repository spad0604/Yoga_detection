// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaseApiResponse<T> _$BaseApiResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _BaseApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$BaseApiResponse<T> {
  @JsonKey(name: 'code')
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this BaseApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BaseApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseApiResponseCopyWith<T, BaseApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseApiResponseCopyWith<T, $Res> {
  factory $BaseApiResponseCopyWith(
          BaseApiResponse<T> value, $Res Function(BaseApiResponse<T>) then) =
      _$BaseApiResponseCopyWithImpl<T, $Res, BaseApiResponse<T>>;
  @useResult
  $Res call({@JsonKey(name: 'code') int? code, @JsonKey(name: 'data') T? data});
}

/// @nodoc
class _$BaseApiResponseCopyWithImpl<T, $Res, $Val extends BaseApiResponse<T>>
    implements $BaseApiResponseCopyWith<T, $Res> {
  _$BaseApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseApiResponseImplCopyWith<T, $Res>
    implements $BaseApiResponseCopyWith<T, $Res> {
  factory _$$BaseApiResponseImplCopyWith(_$BaseApiResponseImpl<T> value,
          $Res Function(_$BaseApiResponseImpl<T>) then) =
      __$$BaseApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'code') int? code, @JsonKey(name: 'data') T? data});
}

/// @nodoc
class __$$BaseApiResponseImplCopyWithImpl<T, $Res>
    extends _$BaseApiResponseCopyWithImpl<T, $Res, _$BaseApiResponseImpl<T>>
    implements _$$BaseApiResponseImplCopyWith<T, $Res> {
  __$$BaseApiResponseImplCopyWithImpl(_$BaseApiResponseImpl<T> _value,
      $Res Function(_$BaseApiResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of BaseApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$BaseApiResponseImpl<T>(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BaseApiResponseImpl<T> implements _BaseApiResponse<T> {
  const _$BaseApiResponseImpl(
      {@JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'data') required this.data});

  factory _$BaseApiResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$BaseApiResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'code')
  final int? code;
  @override
  @JsonKey(name: 'data')
  final T? data;

  @override
  String toString() {
    return 'BaseApiResponse<$T>(code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseApiResponseImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, const DeepCollectionEquality().hash(data));

  /// Create a copy of BaseApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseApiResponseImplCopyWith<T, _$BaseApiResponseImpl<T>> get copyWith =>
      __$$BaseApiResponseImplCopyWithImpl<T, _$BaseApiResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$BaseApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _BaseApiResponse<T> implements BaseApiResponse<T> {
  const factory _BaseApiResponse(
          {@JsonKey(name: 'code') required final int? code,
          @JsonKey(name: 'data') required final T? data}) =
      _$BaseApiResponseImpl<T>;

  factory _BaseApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$BaseApiResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'code')
  int? get code;
  @override
  @JsonKey(name: 'data')
  T? get data;

  /// Create a copy of BaseApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseApiResponseImplCopyWith<T, _$BaseApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

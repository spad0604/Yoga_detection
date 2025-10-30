// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationResponse _$NotificationResponseFromJson(Map<String, dynamic> json) {
  return _NotificationResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'normalTitle')
  String get normalTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'htmlTitle')
  String? get htmlTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'all')
  bool get all => throw _privateConstructorUsedError;

  /// Serializes this NotificationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationResponseCopyWith<NotificationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationResponseCopyWith<$Res> {
  factory $NotificationResponseCopyWith(NotificationResponse value,
          $Res Function(NotificationResponse) then) =
      _$NotificationResponseCopyWithImpl<$Res, NotificationResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'normalTitle') String normalTitle,
      @JsonKey(name: 'htmlTitle') String? htmlTitle,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'all') bool all});
}

/// @nodoc
class _$NotificationResponseCopyWithImpl<$Res,
        $Val extends NotificationResponse>
    implements $NotificationResponseCopyWith<$Res> {
  _$NotificationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? normalTitle = null,
    Object? htmlTitle = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? all = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      normalTitle: null == normalTitle
          ? _value.normalTitle
          : normalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      htmlTitle: freezed == htmlTitle
          ? _value.htmlTitle
          : htmlTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      all: null == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationResponseImplCopyWith<$Res>
    implements $NotificationResponseCopyWith<$Res> {
  factory _$$NotificationResponseImplCopyWith(_$NotificationResponseImpl value,
          $Res Function(_$NotificationResponseImpl) then) =
      __$$NotificationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'normalTitle') String normalTitle,
      @JsonKey(name: 'htmlTitle') String? htmlTitle,
      @JsonKey(name: 'imageUrl') String? imageUrl,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'all') bool all});
}

/// @nodoc
class __$$NotificationResponseImplCopyWithImpl<$Res>
    extends _$NotificationResponseCopyWithImpl<$Res, _$NotificationResponseImpl>
    implements _$$NotificationResponseImplCopyWith<$Res> {
  __$$NotificationResponseImplCopyWithImpl(_$NotificationResponseImpl _value,
      $Res Function(_$NotificationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? normalTitle = null,
    Object? htmlTitle = freezed,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? all = null,
  }) {
    return _then(_$NotificationResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      normalTitle: null == normalTitle
          ? _value.normalTitle
          : normalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      htmlTitle: freezed == htmlTitle
          ? _value.htmlTitle
          : htmlTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      all: null == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationResponseImpl implements _NotificationResponse {
  const _$NotificationResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'normalTitle') required this.normalTitle,
      @JsonKey(name: 'htmlTitle') this.htmlTitle,
      @JsonKey(name: 'imageUrl') this.imageUrl,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'all') required this.all});

  factory _$NotificationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'normalTitle')
  final String normalTitle;
  @override
  @JsonKey(name: 'htmlTitle')
  final String? htmlTitle;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'all')
  final bool all;

  @override
  String toString() {
    return 'NotificationResponse(id: $id, userId: $userId, normalTitle: $normalTitle, htmlTitle: $htmlTitle, imageUrl: $imageUrl, createdAt: $createdAt, all: $all)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.normalTitle, normalTitle) ||
                other.normalTitle == normalTitle) &&
            (identical(other.htmlTitle, htmlTitle) ||
                other.htmlTitle == htmlTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.all, all) || other.all == all));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, normalTitle,
      htmlTitle, imageUrl, createdAt, all);

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationResponseImplCopyWith<_$NotificationResponseImpl>
      get copyWith =>
          __$$NotificationResponseImplCopyWithImpl<_$NotificationResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationResponseImplToJson(
      this,
    );
  }
}

abstract class _NotificationResponse implements NotificationResponse {
  const factory _NotificationResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'userId') required final String userId,
          @JsonKey(name: 'normalTitle') required final String normalTitle,
          @JsonKey(name: 'htmlTitle') final String? htmlTitle,
          @JsonKey(name: 'imageUrl') final String? imageUrl,
          @JsonKey(name: 'createdAt') required final DateTime createdAt,
          @JsonKey(name: 'all') required final bool all}) =
      _$NotificationResponseImpl;

  factory _NotificationResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'normalTitle')
  String get normalTitle;
  @override
  @JsonKey(name: 'htmlTitle')
  String? get htmlTitle;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'all')
  bool get all;

  /// Create a copy of NotificationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationResponseImplCopyWith<_$NotificationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activity_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserActivityResponse _$UserActivityResponseFromJson(Map<String, dynamic> json) {
  return _UserActivityResponse.fromJson(json);
}

/// @nodoc
mixin _$UserActivityResponse {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get userAvatarUrl => throw _privateConstructorUsedError;
  String get activityType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this UserActivityResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActivityResponseCopyWith<UserActivityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityResponseCopyWith<$Res> {
  factory $UserActivityResponseCopyWith(UserActivityResponse value,
          $Res Function(UserActivityResponse) then) =
      _$UserActivityResponseCopyWithImpl<$Res, UserActivityResponse>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String username,
      String? userAvatarUrl,
      String activityType,
      String title,
      String? description,
      Map<String, dynamic>? metadata,
      DateTime createdAt});
}

/// @nodoc
class _$UserActivityResponseCopyWithImpl<$Res,
        $Val extends UserActivityResponse>
    implements $UserActivityResponseCopyWith<$Res> {
  _$UserActivityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? username = null,
    Object? userAvatarUrl = freezed,
    Object? activityType = null,
    Object? title = null,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatarUrl: freezed == userAvatarUrl
          ? _value.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      activityType: null == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserActivityResponseImplCopyWith<$Res>
    implements $UserActivityResponseCopyWith<$Res> {
  factory _$$UserActivityResponseImplCopyWith(_$UserActivityResponseImpl value,
          $Res Function(_$UserActivityResponseImpl) then) =
      __$$UserActivityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String username,
      String? userAvatarUrl,
      String activityType,
      String title,
      String? description,
      Map<String, dynamic>? metadata,
      DateTime createdAt});
}

/// @nodoc
class __$$UserActivityResponseImplCopyWithImpl<$Res>
    extends _$UserActivityResponseCopyWithImpl<$Res, _$UserActivityResponseImpl>
    implements _$$UserActivityResponseImplCopyWith<$Res> {
  __$$UserActivityResponseImplCopyWithImpl(_$UserActivityResponseImpl _value,
      $Res Function(_$UserActivityResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? username = null,
    Object? userAvatarUrl = freezed,
    Object? activityType = null,
    Object? title = null,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$UserActivityResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      userAvatarUrl: freezed == userAvatarUrl
          ? _value.userAvatarUrl
          : userAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      activityType: null == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserActivityResponseImpl implements _UserActivityResponse {
  const _$UserActivityResponseImpl(
      {required this.id,
      required this.userId,
      required this.username,
      this.userAvatarUrl,
      required this.activityType,
      required this.title,
      this.description,
      final Map<String, dynamic>? metadata,
      required this.createdAt})
      : _metadata = metadata;

  factory _$UserActivityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActivityResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String? userAvatarUrl;
  @override
  final String activityType;
  @override
  final String title;
  @override
  final String? description;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'UserActivityResponse(id: $id, userId: $userId, username: $username, userAvatarUrl: $userAvatarUrl, activityType: $activityType, title: $title, description: $description, metadata: $metadata, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivityResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userAvatarUrl, userAvatarUrl) ||
                other.userAvatarUrl == userAvatarUrl) &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      username,
      userAvatarUrl,
      activityType,
      title,
      description,
      const DeepCollectionEquality().hash(_metadata),
      createdAt);

  /// Create a copy of UserActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivityResponseImplCopyWith<_$UserActivityResponseImpl>
      get copyWith =>
          __$$UserActivityResponseImplCopyWithImpl<_$UserActivityResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActivityResponseImplToJson(
      this,
    );
  }
}

abstract class _UserActivityResponse implements UserActivityResponse {
  const factory _UserActivityResponse(
      {required final String id,
      required final String userId,
      required final String username,
      final String? userAvatarUrl,
      required final String activityType,
      required final String title,
      final String? description,
      final Map<String, dynamic>? metadata,
      required final DateTime createdAt}) = _$UserActivityResponseImpl;

  factory _UserActivityResponse.fromJson(Map<String, dynamic> json) =
      _$UserActivityResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get username;
  @override
  String? get userAvatarUrl;
  @override
  String get activityType;
  @override
  String get title;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt;

  /// Create a copy of UserActivityResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActivityResponseImplCopyWith<_$UserActivityResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

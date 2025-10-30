// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) {
  return _CommentResponse.fromJson(json);
}

/// @nodoc
mixin _$CommentResponse {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'postId')
  String get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CommentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentResponseCopyWith<CommentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentResponseCopyWith<$Res> {
  factory $CommentResponseCopyWith(
          CommentResponse value, $Res Function(CommentResponse) then) =
      _$CommentResponseCopyWithImpl<$Res, CommentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'postId') String postId,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'createdAt') String? createdAt});
}

/// @nodoc
class _$CommentResponseCopyWithImpl<$Res, $Val extends CommentResponse>
    implements $CommentResponseCopyWith<$Res> {
  _$CommentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? username = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentResponseImplCopyWith<$Res>
    implements $CommentResponseCopyWith<$Res> {
  factory _$$CommentResponseImplCopyWith(_$CommentResponseImpl value,
          $Res Function(_$CommentResponseImpl) then) =
      __$$CommentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'postId') String postId,
      @JsonKey(name: 'userId') String userId,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'createdAt') String? createdAt});
}

/// @nodoc
class __$$CommentResponseImplCopyWithImpl<$Res>
    extends _$CommentResponseCopyWithImpl<$Res, _$CommentResponseImpl>
    implements _$$CommentResponseImplCopyWith<$Res> {
  __$$CommentResponseImplCopyWithImpl(
      _$CommentResponseImpl _value, $Res Function(_$CommentResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? userId = null,
    Object? username = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$CommentResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentResponseImpl implements _CommentResponse {
  const _$CommentResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'postId') required this.postId,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'createdAt') this.createdAt});

  factory _$CommentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'postId')
  final String postId;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  String toString() {
    return 'CommentResponse(id: $id, postId: $postId, userId: $userId, username: $username, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, postId, userId, username, content, createdAt);

  /// Create a copy of CommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentResponseImplCopyWith<_$CommentResponseImpl> get copyWith =>
      __$$CommentResponseImplCopyWithImpl<_$CommentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentResponseImplToJson(
      this,
    );
  }
}

abstract class _CommentResponse implements CommentResponse {
  const factory _CommentResponse(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'postId') required final String postId,
          @JsonKey(name: 'userId') required final String userId,
          @JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'content') final String? content,
          @JsonKey(name: 'createdAt') final String? createdAt}) =
      _$CommentResponseImpl;

  factory _CommentResponse.fromJson(Map<String, dynamic> json) =
      _$CommentResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'postId')
  String get postId;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;

  /// Create a copy of CommentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentResponseImplCopyWith<_$CommentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

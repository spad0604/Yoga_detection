// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) {
  return _PostResponse.fromJson(json);
}

/// @nodoc
mixin _$PostResponse {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'groupId')
  String get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorId')
  String get authorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorName')
  String? get authorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrls')
  String? get imageUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'likeCount')
  int get likeCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'commentCount')
  int get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'likedByMe')
  bool get likedByMe => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PostResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostResponseCopyWith<PostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostResponseCopyWith<$Res> {
  factory $PostResponseCopyWith(
          PostResponse value, $Res Function(PostResponse) then) =
      _$PostResponseCopyWithImpl<$Res, PostResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'groupId') String groupId,
      @JsonKey(name: 'authorId') String authorId,
      @JsonKey(name: 'authorName') String? authorName,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'imageUrls') String? imageUrls,
      @JsonKey(name: 'likeCount') int likeCount,
      @JsonKey(name: 'commentCount') int commentCount,
      @JsonKey(name: 'likedByMe') bool likedByMe,
      @JsonKey(name: 'createdAt') String? createdAt});
}

/// @nodoc
class _$PostResponseCopyWithImpl<$Res, $Val extends PostResponse>
    implements $PostResponseCopyWith<$Res> {
  _$PostResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? authorId = null,
    Object? authorName = freezed,
    Object? content = freezed,
    Object? imageUrls = freezed,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? likedByMe = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedByMe: null == likedByMe
          ? _value.likedByMe
          : likedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostResponseImplCopyWith<$Res>
    implements $PostResponseCopyWith<$Res> {
  factory _$$PostResponseImplCopyWith(
          _$PostResponseImpl value, $Res Function(_$PostResponseImpl) then) =
      __$$PostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'groupId') String groupId,
      @JsonKey(name: 'authorId') String authorId,
      @JsonKey(name: 'authorName') String? authorName,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'imageUrls') String? imageUrls,
      @JsonKey(name: 'likeCount') int likeCount,
      @JsonKey(name: 'commentCount') int commentCount,
      @JsonKey(name: 'likedByMe') bool likedByMe,
      @JsonKey(name: 'createdAt') String? createdAt});
}

/// @nodoc
class __$$PostResponseImplCopyWithImpl<$Res>
    extends _$PostResponseCopyWithImpl<$Res, _$PostResponseImpl>
    implements _$$PostResponseImplCopyWith<$Res> {
  __$$PostResponseImplCopyWithImpl(
      _$PostResponseImpl _value, $Res Function(_$PostResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? groupId = null,
    Object? authorId = null,
    Object? authorName = freezed,
    Object? content = freezed,
    Object? imageUrls = freezed,
    Object? likeCount = null,
    Object? commentCount = null,
    Object? likedByMe = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$PostResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as String?,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedByMe: null == likedByMe
          ? _value.likedByMe
          : likedByMe // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostResponseImpl implements _PostResponse {
  const _$PostResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'groupId') required this.groupId,
      @JsonKey(name: 'authorId') required this.authorId,
      @JsonKey(name: 'authorName') this.authorName,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'imageUrls') this.imageUrls,
      @JsonKey(name: 'likeCount') this.likeCount = 0,
      @JsonKey(name: 'commentCount') this.commentCount = 0,
      @JsonKey(name: 'likedByMe') this.likedByMe = false,
      @JsonKey(name: 'createdAt') this.createdAt});

  factory _$PostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'groupId')
  final String groupId;
  @override
  @JsonKey(name: 'authorId')
  final String authorId;
  @override
  @JsonKey(name: 'authorName')
  final String? authorName;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'imageUrls')
  final String? imageUrls;
  @override
  @JsonKey(name: 'likeCount')
  final int likeCount;
  @override
  @JsonKey(name: 'commentCount')
  final int commentCount;
  @override
  @JsonKey(name: 'likedByMe')
  final bool likedByMe;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  @override
  String toString() {
    return 'PostResponse(id: $id, groupId: $groupId, authorId: $authorId, authorName: $authorName, content: $content, imageUrls: $imageUrls, likeCount: $likeCount, commentCount: $commentCount, likedByMe: $likedByMe, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrls, imageUrls) ||
                other.imageUrls == imageUrls) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.likedByMe, likedByMe) ||
                other.likedByMe == likedByMe) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      groupId,
      authorId,
      authorName,
      content,
      imageUrls,
      likeCount,
      commentCount,
      likedByMe,
      createdAt);

  /// Create a copy of PostResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostResponseImplCopyWith<_$PostResponseImpl> get copyWith =>
      __$$PostResponseImplCopyWithImpl<_$PostResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostResponseImplToJson(
      this,
    );
  }
}

abstract class _PostResponse implements PostResponse {
  const factory _PostResponse(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'groupId') required final String groupId,
          @JsonKey(name: 'authorId') required final String authorId,
          @JsonKey(name: 'authorName') final String? authorName,
          @JsonKey(name: 'content') final String? content,
          @JsonKey(name: 'imageUrls') final String? imageUrls,
          @JsonKey(name: 'likeCount') final int likeCount,
          @JsonKey(name: 'commentCount') final int commentCount,
          @JsonKey(name: 'likedByMe') final bool likedByMe,
          @JsonKey(name: 'createdAt') final String? createdAt}) =
      _$PostResponseImpl;

  factory _PostResponse.fromJson(Map<String, dynamic> json) =
      _$PostResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'groupId')
  String get groupId;
  @override
  @JsonKey(name: 'authorId')
  String get authorId;
  @override
  @JsonKey(name: 'authorName')
  String? get authorName;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(name: 'imageUrls')
  String? get imageUrls;
  @override
  @JsonKey(name: 'likeCount')
  int get likeCount;
  @override
  @JsonKey(name: 'commentCount')
  int get commentCount;
  @override
  @JsonKey(name: 'likedByMe')
  bool get likedByMe;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;

  /// Create a copy of PostResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostResponseImplCopyWith<_$PostResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

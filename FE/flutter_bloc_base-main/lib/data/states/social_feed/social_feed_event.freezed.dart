// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_feed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SocialFeedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialFeedEventCopyWith<$Res> {
  factory $SocialFeedEventCopyWith(
          SocialFeedEvent value, $Res Function(SocialFeedEvent) then) =
      _$SocialFeedEventCopyWithImpl<$Res, SocialFeedEvent>;
}

/// @nodoc
class _$SocialFeedEventCopyWithImpl<$Res, $Val extends SocialFeedEvent>
    implements $SocialFeedEventCopyWith<$Res> {
  _$SocialFeedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SocialFeedFetchFeedImplCopyWith<$Res> {
  factory _$$SocialFeedFetchFeedImplCopyWith(_$SocialFeedFetchFeedImpl value,
          $Res Function(_$SocialFeedFetchFeedImpl) then) =
      __$$SocialFeedFetchFeedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page, int size, String scope});
}

/// @nodoc
class __$$SocialFeedFetchFeedImplCopyWithImpl<$Res>
    extends _$SocialFeedEventCopyWithImpl<$Res, _$SocialFeedFetchFeedImpl>
    implements _$$SocialFeedFetchFeedImplCopyWith<$Res> {
  __$$SocialFeedFetchFeedImplCopyWithImpl(_$SocialFeedFetchFeedImpl _value,
      $Res Function(_$SocialFeedFetchFeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? scope = null,
  }) {
    return _then(_$SocialFeedFetchFeedImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialFeedFetchFeedImpl implements SocialFeedFetchFeed {
  const _$SocialFeedFetchFeedImpl(
      {this.page = 0, this.size = 20, this.scope = socialFeedScopePublic});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final String scope;

  @override
  String toString() {
    return 'SocialFeedEvent.fetchFeed(page: $page, size: $size, scope: $scope)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialFeedFetchFeedImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.scope, scope) || other.scope == scope));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size, scope);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialFeedFetchFeedImplCopyWith<_$SocialFeedFetchFeedImpl> get copyWith =>
      __$$SocialFeedFetchFeedImplCopyWithImpl<_$SocialFeedFetchFeedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) {
    return fetchFeed(page, size, scope);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) {
    return fetchFeed?.call(page, size, scope);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) {
    if (fetchFeed != null) {
      return fetchFeed(page, size, scope);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) {
    return fetchFeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) {
    return fetchFeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (fetchFeed != null) {
      return fetchFeed(this);
    }
    return orElse();
  }
}

abstract class SocialFeedFetchFeed implements SocialFeedEvent {
  const factory SocialFeedFetchFeed(
      {final int page,
      final int size,
      final String scope}) = _$SocialFeedFetchFeedImpl;

  int get page;
  int get size;
  String get scope;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialFeedFetchFeedImplCopyWith<_$SocialFeedFetchFeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialFeedCreatePostImplCopyWith<$Res> {
  factory _$$SocialFeedCreatePostImplCopyWith(_$SocialFeedCreatePostImpl value,
          $Res Function(_$SocialFeedCreatePostImpl) then) =
      __$$SocialFeedCreatePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? content, List<String> imagePaths, String visibility});
}

/// @nodoc
class __$$SocialFeedCreatePostImplCopyWithImpl<$Res>
    extends _$SocialFeedEventCopyWithImpl<$Res, _$SocialFeedCreatePostImpl>
    implements _$$SocialFeedCreatePostImplCopyWith<$Res> {
  __$$SocialFeedCreatePostImplCopyWithImpl(_$SocialFeedCreatePostImpl _value,
      $Res Function(_$SocialFeedCreatePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = freezed,
    Object? imagePaths = null,
    Object? visibility = null,
  }) {
    return _then(_$SocialFeedCreatePostImpl(
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePaths: null == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialFeedCreatePostImpl implements SocialFeedCreatePost {
  const _$SocialFeedCreatePostImpl(
      {this.content,
      final List<String> imagePaths = const <String>[],
      this.visibility = 'PUBLIC'})
      : _imagePaths = imagePaths;

  @override
  final String? content;
  final List<String> _imagePaths;
  @override
  @JsonKey()
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  @JsonKey()
  final String visibility;

  @override
  String toString() {
    return 'SocialFeedEvent.createPost(content: $content, imagePaths: $imagePaths, visibility: $visibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialFeedCreatePostImpl &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content,
      const DeepCollectionEquality().hash(_imagePaths), visibility);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialFeedCreatePostImplCopyWith<_$SocialFeedCreatePostImpl>
      get copyWith =>
          __$$SocialFeedCreatePostImplCopyWithImpl<_$SocialFeedCreatePostImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) {
    return createPost(content, imagePaths, visibility);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) {
    return createPost?.call(content, imagePaths, visibility);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(content, imagePaths, visibility);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) {
    return createPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) {
    return createPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(this);
    }
    return orElse();
  }
}

abstract class SocialFeedCreatePost implements SocialFeedEvent {
  const factory SocialFeedCreatePost(
      {final String? content,
      final List<String> imagePaths,
      final String visibility}) = _$SocialFeedCreatePostImpl;

  String? get content;
  List<String> get imagePaths;
  String get visibility;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialFeedCreatePostImplCopyWith<_$SocialFeedCreatePostImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialFeedLikePostImplCopyWith<$Res> {
  factory _$$SocialFeedLikePostImplCopyWith(_$SocialFeedLikePostImpl value,
          $Res Function(_$SocialFeedLikePostImpl) then) =
      __$$SocialFeedLikePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$SocialFeedLikePostImplCopyWithImpl<$Res>
    extends _$SocialFeedEventCopyWithImpl<$Res, _$SocialFeedLikePostImpl>
    implements _$$SocialFeedLikePostImplCopyWith<$Res> {
  __$$SocialFeedLikePostImplCopyWithImpl(_$SocialFeedLikePostImpl _value,
      $Res Function(_$SocialFeedLikePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$SocialFeedLikePostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialFeedLikePostImpl implements SocialFeedLikePost {
  const _$SocialFeedLikePostImpl({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'SocialFeedEvent.likePost(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialFeedLikePostImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialFeedLikePostImplCopyWith<_$SocialFeedLikePostImpl> get copyWith =>
      __$$SocialFeedLikePostImplCopyWithImpl<_$SocialFeedLikePostImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) {
    return likePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) {
    return likePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(this);
    }
    return orElse();
  }
}

abstract class SocialFeedLikePost implements SocialFeedEvent {
  const factory SocialFeedLikePost({required final String postId}) =
      _$SocialFeedLikePostImpl;

  String get postId;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialFeedLikePostImplCopyWith<_$SocialFeedLikePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialFeedUnlikePostImplCopyWith<$Res> {
  factory _$$SocialFeedUnlikePostImplCopyWith(_$SocialFeedUnlikePostImpl value,
          $Res Function(_$SocialFeedUnlikePostImpl) then) =
      __$$SocialFeedUnlikePostImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId});
}

/// @nodoc
class __$$SocialFeedUnlikePostImplCopyWithImpl<$Res>
    extends _$SocialFeedEventCopyWithImpl<$Res, _$SocialFeedUnlikePostImpl>
    implements _$$SocialFeedUnlikePostImplCopyWith<$Res> {
  __$$SocialFeedUnlikePostImplCopyWithImpl(_$SocialFeedUnlikePostImpl _value,
      $Res Function(_$SocialFeedUnlikePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
  }) {
    return _then(_$SocialFeedUnlikePostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialFeedUnlikePostImpl implements SocialFeedUnlikePost {
  const _$SocialFeedUnlikePostImpl({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'SocialFeedEvent.unlikePost(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialFeedUnlikePostImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialFeedUnlikePostImplCopyWith<_$SocialFeedUnlikePostImpl>
      get copyWith =>
          __$$SocialFeedUnlikePostImplCopyWithImpl<_$SocialFeedUnlikePostImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) {
    return unlikePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) {
    return unlikePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) {
    if (unlikePost != null) {
      return unlikePost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) {
    return unlikePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) {
    return unlikePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (unlikePost != null) {
      return unlikePost(this);
    }
    return orElse();
  }
}

abstract class SocialFeedUnlikePost implements SocialFeedEvent {
  const factory SocialFeedUnlikePost({required final String postId}) =
      _$SocialFeedUnlikePostImpl;

  String get postId;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialFeedUnlikePostImplCopyWith<_$SocialFeedUnlikePostImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialFeedAddCommentImplCopyWith<$Res> {
  factory _$$SocialFeedAddCommentImplCopyWith(_$SocialFeedAddCommentImpl value,
          $Res Function(_$SocialFeedAddCommentImpl) then) =
      __$$SocialFeedAddCommentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId, String content});
}

/// @nodoc
class __$$SocialFeedAddCommentImplCopyWithImpl<$Res>
    extends _$SocialFeedEventCopyWithImpl<$Res, _$SocialFeedAddCommentImpl>
    implements _$$SocialFeedAddCommentImplCopyWith<$Res> {
  __$$SocialFeedAddCommentImplCopyWithImpl(_$SocialFeedAddCommentImpl _value,
      $Res Function(_$SocialFeedAddCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? content = null,
  }) {
    return _then(_$SocialFeedAddCommentImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialFeedAddCommentImpl implements SocialFeedAddComment {
  const _$SocialFeedAddCommentImpl(
      {required this.postId, required this.content});

  @override
  final String postId;
  @override
  final String content;

  @override
  String toString() {
    return 'SocialFeedEvent.addComment(postId: $postId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialFeedAddCommentImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, content);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialFeedAddCommentImplCopyWith<_$SocialFeedAddCommentImpl>
      get copyWith =>
          __$$SocialFeedAddCommentImplCopyWithImpl<_$SocialFeedAddCommentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) {
    return addComment(postId, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) {
    return addComment?.call(postId, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) {
    if (addComment != null) {
      return addComment(postId, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) {
    return addComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) {
    return addComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (addComment != null) {
      return addComment(this);
    }
    return orElse();
  }
}

abstract class SocialFeedAddComment implements SocialFeedEvent {
  const factory SocialFeedAddComment(
      {required final String postId,
      required final String content}) = _$SocialFeedAddCommentImpl;

  String get postId;
  String get content;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialFeedAddCommentImplCopyWith<_$SocialFeedAddCommentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialFeedFetchCommentsImplCopyWith<$Res> {
  factory _$$SocialFeedFetchCommentsImplCopyWith(
          _$SocialFeedFetchCommentsImpl value,
          $Res Function(_$SocialFeedFetchCommentsImpl) then) =
      __$$SocialFeedFetchCommentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String postId, int page, int size});
}

/// @nodoc
class __$$SocialFeedFetchCommentsImplCopyWithImpl<$Res>
    extends _$SocialFeedEventCopyWithImpl<$Res, _$SocialFeedFetchCommentsImpl>
    implements _$$SocialFeedFetchCommentsImplCopyWith<$Res> {
  __$$SocialFeedFetchCommentsImplCopyWithImpl(
      _$SocialFeedFetchCommentsImpl _value,
      $Res Function(_$SocialFeedFetchCommentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$SocialFeedFetchCommentsImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SocialFeedFetchCommentsImpl implements SocialFeedFetchComments {
  const _$SocialFeedFetchCommentsImpl(
      {required this.postId, this.page = 0, this.size = 20});

  @override
  final String postId;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'SocialFeedEvent.fetchComments(postId: $postId, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialFeedFetchCommentsImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, page, size);

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialFeedFetchCommentsImplCopyWith<_$SocialFeedFetchCommentsImpl>
      get copyWith => __$$SocialFeedFetchCommentsImplCopyWithImpl<
          _$SocialFeedFetchCommentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, int size, String scope) fetchFeed,
    required TResult Function(
            String? content, List<String> imagePaths, String visibility)
        createPost,
    required TResult Function(String postId) likePost,
    required TResult Function(String postId) unlikePost,
    required TResult Function(String postId, String content) addComment,
    required TResult Function(String postId, int page, int size) fetchComments,
  }) {
    return fetchComments(postId, page, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page, int size, String scope)? fetchFeed,
    TResult? Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult? Function(String postId)? likePost,
    TResult? Function(String postId)? unlikePost,
    TResult? Function(String postId, String content)? addComment,
    TResult? Function(String postId, int page, int size)? fetchComments,
  }) {
    return fetchComments?.call(postId, page, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, int size, String scope)? fetchFeed,
    TResult Function(
            String? content, List<String> imagePaths, String visibility)?
        createPost,
    TResult Function(String postId)? likePost,
    TResult Function(String postId)? unlikePost,
    TResult Function(String postId, String content)? addComment,
    TResult Function(String postId, int page, int size)? fetchComments,
    required TResult orElse(),
  }) {
    if (fetchComments != null) {
      return fetchComments(postId, page, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SocialFeedFetchFeed value) fetchFeed,
    required TResult Function(SocialFeedCreatePost value) createPost,
    required TResult Function(SocialFeedLikePost value) likePost,
    required TResult Function(SocialFeedUnlikePost value) unlikePost,
    required TResult Function(SocialFeedAddComment value) addComment,
    required TResult Function(SocialFeedFetchComments value) fetchComments,
  }) {
    return fetchComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult? Function(SocialFeedCreatePost value)? createPost,
    TResult? Function(SocialFeedLikePost value)? likePost,
    TResult? Function(SocialFeedUnlikePost value)? unlikePost,
    TResult? Function(SocialFeedAddComment value)? addComment,
    TResult? Function(SocialFeedFetchComments value)? fetchComments,
  }) {
    return fetchComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SocialFeedFetchFeed value)? fetchFeed,
    TResult Function(SocialFeedCreatePost value)? createPost,
    TResult Function(SocialFeedLikePost value)? likePost,
    TResult Function(SocialFeedUnlikePost value)? unlikePost,
    TResult Function(SocialFeedAddComment value)? addComment,
    TResult Function(SocialFeedFetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (fetchComments != null) {
      return fetchComments(this);
    }
    return orElse();
  }
}

abstract class SocialFeedFetchComments implements SocialFeedEvent {
  const factory SocialFeedFetchComments(
      {required final String postId,
      final int page,
      final int size}) = _$SocialFeedFetchCommentsImpl;

  String get postId;
  int get page;
  int get size;

  /// Create a copy of SocialFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialFeedFetchCommentsImplCopyWith<_$SocialFeedFetchCommentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

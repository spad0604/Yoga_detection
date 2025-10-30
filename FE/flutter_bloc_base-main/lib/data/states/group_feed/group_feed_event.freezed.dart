// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_feed_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GroupFeedEvent {
  String get groupId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupFeedEventCopyWith<GroupFeedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupFeedEventCopyWith<$Res> {
  factory $GroupFeedEventCopyWith(
          GroupFeedEvent value, $Res Function(GroupFeedEvent) then) =
      _$GroupFeedEventCopyWithImpl<$Res, GroupFeedEvent>;
  @useResult
  $Res call({String groupId});
}

/// @nodoc
class _$GroupFeedEventCopyWithImpl<$Res, $Val extends GroupFeedEvent>
    implements $GroupFeedEventCopyWith<$Res> {
  _$GroupFeedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
  }) {
    return _then(_value.copyWith(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchFeedImplCopyWith<$Res>
    implements $GroupFeedEventCopyWith<$Res> {
  factory _$$FetchFeedImplCopyWith(
          _$FetchFeedImpl value, $Res Function(_$FetchFeedImpl) then) =
      __$$FetchFeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, int page, int size});
}

/// @nodoc
class __$$FetchFeedImplCopyWithImpl<$Res>
    extends _$GroupFeedEventCopyWithImpl<$Res, _$FetchFeedImpl>
    implements _$$FetchFeedImplCopyWith<$Res> {
  __$$FetchFeedImplCopyWithImpl(
      _$FetchFeedImpl _value, $Res Function(_$FetchFeedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$FetchFeedImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
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

class _$FetchFeedImpl implements FetchFeed {
  const _$FetchFeedImpl({required this.groupId, this.page = 0, this.size = 20});

  @override
  final String groupId;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'GroupFeedEvent.fetchFeed(groupId: $groupId, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFeedImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, page, size);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFeedImplCopyWith<_$FetchFeedImpl> get copyWith =>
      __$$FetchFeedImplCopyWithImpl<_$FetchFeedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) {
    return fetchFeed(groupId, page, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) {
    return fetchFeed?.call(groupId, page, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) {
    if (fetchFeed != null) {
      return fetchFeed(groupId, page, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) {
    return fetchFeed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) {
    return fetchFeed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (fetchFeed != null) {
      return fetchFeed(this);
    }
    return orElse();
  }
}

abstract class FetchFeed implements GroupFeedEvent {
  const factory FetchFeed(
      {required final String groupId,
      final int page,
      final int size}) = _$FetchFeedImpl;

  @override
  String get groupId;
  int get page;
  int get size;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchFeedImplCopyWith<_$FetchFeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreatePostImplCopyWith<$Res>
    implements $GroupFeedEventCopyWith<$Res> {
  factory _$$CreatePostImplCopyWith(
          _$CreatePostImpl value, $Res Function(_$CreatePostImpl) then) =
      __$$CreatePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, String content, List<String>? imagePaths});
}

/// @nodoc
class __$$CreatePostImplCopyWithImpl<$Res>
    extends _$GroupFeedEventCopyWithImpl<$Res, _$CreatePostImpl>
    implements _$$CreatePostImplCopyWith<$Res> {
  __$$CreatePostImplCopyWithImpl(
      _$CreatePostImpl _value, $Res Function(_$CreatePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? content = null,
    Object? imagePaths = freezed,
  }) {
    return _then(_$CreatePostImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imagePaths: freezed == imagePaths
          ? _value._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$CreatePostImpl implements CreatePost {
  const _$CreatePostImpl(
      {required this.groupId,
      required this.content,
      final List<String>? imagePaths})
      : _imagePaths = imagePaths;

  @override
  final String groupId;
  @override
  final String content;
  final List<String>? _imagePaths;
  @override
  List<String>? get imagePaths {
    final value = _imagePaths;
    if (value == null) return null;
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GroupFeedEvent.createPost(groupId: $groupId, content: $content, imagePaths: $imagePaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, content,
      const DeepCollectionEquality().hash(_imagePaths));

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      __$$CreatePostImplCopyWithImpl<_$CreatePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) {
    return createPost(groupId, content, imagePaths);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) {
    return createPost?.call(groupId, content, imagePaths);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(groupId, content, imagePaths);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) {
    return createPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) {
    return createPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(this);
    }
    return orElse();
  }
}

abstract class CreatePost implements GroupFeedEvent {
  const factory CreatePost(
      {required final String groupId,
      required final String content,
      final List<String>? imagePaths}) = _$CreatePostImpl;

  @override
  String get groupId;
  String get content;
  List<String>? get imagePaths;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostImplCopyWith<_$CreatePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LikePostImplCopyWith<$Res>
    implements $GroupFeedEventCopyWith<$Res> {
  factory _$$LikePostImplCopyWith(
          _$LikePostImpl value, $Res Function(_$LikePostImpl) then) =
      __$$LikePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, String postId});
}

/// @nodoc
class __$$LikePostImplCopyWithImpl<$Res>
    extends _$GroupFeedEventCopyWithImpl<$Res, _$LikePostImpl>
    implements _$$LikePostImplCopyWith<$Res> {
  __$$LikePostImplCopyWithImpl(
      _$LikePostImpl _value, $Res Function(_$LikePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? postId = null,
  }) {
    return _then(_$LikePostImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LikePostImpl implements LikePost {
  const _$LikePostImpl({required this.groupId, required this.postId});

  @override
  final String groupId;
  @override
  final String postId;

  @override
  String toString() {
    return 'GroupFeedEvent.likePost(groupId: $groupId, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikePostImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, postId);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LikePostImplCopyWith<_$LikePostImpl> get copyWith =>
      __$$LikePostImplCopyWithImpl<_$LikePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) {
    return likePost(groupId, postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) {
    return likePost?.call(groupId, postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(groupId, postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(this);
    }
    return orElse();
  }
}

abstract class LikePost implements GroupFeedEvent {
  const factory LikePost(
      {required final String groupId,
      required final String postId}) = _$LikePostImpl;

  @override
  String get groupId;
  String get postId;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LikePostImplCopyWith<_$LikePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnlikePostImplCopyWith<$Res>
    implements $GroupFeedEventCopyWith<$Res> {
  factory _$$UnlikePostImplCopyWith(
          _$UnlikePostImpl value, $Res Function(_$UnlikePostImpl) then) =
      __$$UnlikePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, String postId});
}

/// @nodoc
class __$$UnlikePostImplCopyWithImpl<$Res>
    extends _$GroupFeedEventCopyWithImpl<$Res, _$UnlikePostImpl>
    implements _$$UnlikePostImplCopyWith<$Res> {
  __$$UnlikePostImplCopyWithImpl(
      _$UnlikePostImpl _value, $Res Function(_$UnlikePostImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? postId = null,
  }) {
    return _then(_$UnlikePostImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnlikePostImpl implements UnlikePost {
  const _$UnlikePostImpl({required this.groupId, required this.postId});

  @override
  final String groupId;
  @override
  final String postId;

  @override
  String toString() {
    return 'GroupFeedEvent.unlikePost(groupId: $groupId, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnlikePostImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, postId);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnlikePostImplCopyWith<_$UnlikePostImpl> get copyWith =>
      __$$UnlikePostImplCopyWithImpl<_$UnlikePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) {
    return unlikePost(groupId, postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) {
    return unlikePost?.call(groupId, postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) {
    if (unlikePost != null) {
      return unlikePost(groupId, postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) {
    return unlikePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) {
    return unlikePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (unlikePost != null) {
      return unlikePost(this);
    }
    return orElse();
  }
}

abstract class UnlikePost implements GroupFeedEvent {
  const factory UnlikePost(
      {required final String groupId,
      required final String postId}) = _$UnlikePostImpl;

  @override
  String get groupId;
  String get postId;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnlikePostImplCopyWith<_$UnlikePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddCommentImplCopyWith<$Res>
    implements $GroupFeedEventCopyWith<$Res> {
  factory _$$AddCommentImplCopyWith(
          _$AddCommentImpl value, $Res Function(_$AddCommentImpl) then) =
      __$$AddCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, String postId, String content});
}

/// @nodoc
class __$$AddCommentImplCopyWithImpl<$Res>
    extends _$GroupFeedEventCopyWithImpl<$Res, _$AddCommentImpl>
    implements _$$AddCommentImplCopyWith<$Res> {
  __$$AddCommentImplCopyWithImpl(
      _$AddCommentImpl _value, $Res Function(_$AddCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? postId = null,
    Object? content = null,
  }) {
    return _then(_$AddCommentImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$AddCommentImpl implements AddComment {
  const _$AddCommentImpl(
      {required this.groupId, required this.postId, required this.content});

  @override
  final String groupId;
  @override
  final String postId;
  @override
  final String content;

  @override
  String toString() {
    return 'GroupFeedEvent.addComment(groupId: $groupId, postId: $postId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCommentImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, postId, content);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCommentImplCopyWith<_$AddCommentImpl> get copyWith =>
      __$$AddCommentImplCopyWithImpl<_$AddCommentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) {
    return addComment(groupId, postId, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) {
    return addComment?.call(groupId, postId, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) {
    if (addComment != null) {
      return addComment(groupId, postId, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) {
    return addComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) {
    return addComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (addComment != null) {
      return addComment(this);
    }
    return orElse();
  }
}

abstract class AddComment implements GroupFeedEvent {
  const factory AddComment(
      {required final String groupId,
      required final String postId,
      required final String content}) = _$AddCommentImpl;

  @override
  String get groupId;
  String get postId;
  String get content;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCommentImplCopyWith<_$AddCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCommentsImplCopyWith<$Res>
    implements $GroupFeedEventCopyWith<$Res> {
  factory _$$FetchCommentsImplCopyWith(
          _$FetchCommentsImpl value, $Res Function(_$FetchCommentsImpl) then) =
      __$$FetchCommentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String groupId, String postId, int page, int size});
}

/// @nodoc
class __$$FetchCommentsImplCopyWithImpl<$Res>
    extends _$GroupFeedEventCopyWithImpl<$Res, _$FetchCommentsImpl>
    implements _$$FetchCommentsImplCopyWith<$Res> {
  __$$FetchCommentsImplCopyWithImpl(
      _$FetchCommentsImpl _value, $Res Function(_$FetchCommentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupId = null,
    Object? postId = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$FetchCommentsImpl(
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$FetchCommentsImpl implements FetchComments {
  const _$FetchCommentsImpl(
      {required this.groupId,
      required this.postId,
      this.page = 0,
      this.size = 20});

  @override
  final String groupId;
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
    return 'GroupFeedEvent.fetchComments(groupId: $groupId, postId: $postId, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCommentsImpl &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, groupId, postId, page, size);

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCommentsImplCopyWith<_$FetchCommentsImpl> get copyWith =>
      __$$FetchCommentsImplCopyWithImpl<_$FetchCommentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String groupId, int page, int size) fetchFeed,
    required TResult Function(
            String groupId, String content, List<String>? imagePaths)
        createPost,
    required TResult Function(String groupId, String postId) likePost,
    required TResult Function(String groupId, String postId) unlikePost,
    required TResult Function(String groupId, String postId, String content)
        addComment,
    required TResult Function(String groupId, String postId, int page, int size)
        fetchComments,
  }) {
    return fetchComments(groupId, postId, page, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String groupId, int page, int size)? fetchFeed,
    TResult? Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult? Function(String groupId, String postId)? likePost,
    TResult? Function(String groupId, String postId)? unlikePost,
    TResult? Function(String groupId, String postId, String content)?
        addComment,
    TResult? Function(String groupId, String postId, int page, int size)?
        fetchComments,
  }) {
    return fetchComments?.call(groupId, postId, page, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String groupId, int page, int size)? fetchFeed,
    TResult Function(String groupId, String content, List<String>? imagePaths)?
        createPost,
    TResult Function(String groupId, String postId)? likePost,
    TResult Function(String groupId, String postId)? unlikePost,
    TResult Function(String groupId, String postId, String content)? addComment,
    TResult Function(String groupId, String postId, int page, int size)?
        fetchComments,
    required TResult orElse(),
  }) {
    if (fetchComments != null) {
      return fetchComments(groupId, postId, page, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchFeed value) fetchFeed,
    required TResult Function(CreatePost value) createPost,
    required TResult Function(LikePost value) likePost,
    required TResult Function(UnlikePost value) unlikePost,
    required TResult Function(AddComment value) addComment,
    required TResult Function(FetchComments value) fetchComments,
  }) {
    return fetchComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchFeed value)? fetchFeed,
    TResult? Function(CreatePost value)? createPost,
    TResult? Function(LikePost value)? likePost,
    TResult? Function(UnlikePost value)? unlikePost,
    TResult? Function(AddComment value)? addComment,
    TResult? Function(FetchComments value)? fetchComments,
  }) {
    return fetchComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchFeed value)? fetchFeed,
    TResult Function(CreatePost value)? createPost,
    TResult Function(LikePost value)? likePost,
    TResult Function(UnlikePost value)? unlikePost,
    TResult Function(AddComment value)? addComment,
    TResult Function(FetchComments value)? fetchComments,
    required TResult orElse(),
  }) {
    if (fetchComments != null) {
      return fetchComments(this);
    }
    return orElse();
  }
}

abstract class FetchComments implements GroupFeedEvent {
  const factory FetchComments(
      {required final String groupId,
      required final String postId,
      final int page,
      final int size}) = _$FetchCommentsImpl;

  @override
  String get groupId;
  String get postId;
  int get page;
  int get size;

  /// Create a copy of GroupFeedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchCommentsImplCopyWith<_$FetchCommentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

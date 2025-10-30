// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatePostRequest _$CreatePostRequestFromJson(Map<String, dynamic> json) {
  return _CreatePostRequest.fromJson(json);
}

/// @nodoc
mixin _$CreatePostRequest {
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrls')
  String? get imageUrls => throw _privateConstructorUsedError;

  /// Serializes this CreatePostRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatePostRequestCopyWith<CreatePostRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePostRequestCopyWith<$Res> {
  factory $CreatePostRequestCopyWith(
          CreatePostRequest value, $Res Function(CreatePostRequest) then) =
      _$CreatePostRequestCopyWithImpl<$Res, CreatePostRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'content') String content,
      @JsonKey(name: 'imageUrls') String? imageUrls});
}

/// @nodoc
class _$CreatePostRequestCopyWithImpl<$Res, $Val extends CreatePostRequest>
    implements $CreatePostRequestCopyWith<$Res> {
  _$CreatePostRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? imageUrls = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePostRequestImplCopyWith<$Res>
    implements $CreatePostRequestCopyWith<$Res> {
  factory _$$CreatePostRequestImplCopyWith(_$CreatePostRequestImpl value,
          $Res Function(_$CreatePostRequestImpl) then) =
      __$$CreatePostRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'content') String content,
      @JsonKey(name: 'imageUrls') String? imageUrls});
}

/// @nodoc
class __$$CreatePostRequestImplCopyWithImpl<$Res>
    extends _$CreatePostRequestCopyWithImpl<$Res, _$CreatePostRequestImpl>
    implements _$$CreatePostRequestImplCopyWith<$Res> {
  __$$CreatePostRequestImplCopyWithImpl(_$CreatePostRequestImpl _value,
      $Res Function(_$CreatePostRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? imageUrls = freezed,
  }) {
    return _then(_$CreatePostRequestImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatePostRequestImpl implements _CreatePostRequest {
  const _$CreatePostRequestImpl(
      {@JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'imageUrls') this.imageUrls});

  factory _$CreatePostRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatePostRequestImplFromJson(json);

  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'imageUrls')
  final String? imageUrls;

  @override
  String toString() {
    return 'CreatePostRequest(content: $content, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePostRequestImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrls, imageUrls) ||
                other.imageUrls == imageUrls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content, imageUrls);

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePostRequestImplCopyWith<_$CreatePostRequestImpl> get copyWith =>
      __$$CreatePostRequestImplCopyWithImpl<_$CreatePostRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatePostRequestImplToJson(
      this,
    );
  }
}

abstract class _CreatePostRequest implements CreatePostRequest {
  const factory _CreatePostRequest(
          {@JsonKey(name: 'content') required final String content,
          @JsonKey(name: 'imageUrls') final String? imageUrls}) =
      _$CreatePostRequestImpl;

  factory _CreatePostRequest.fromJson(Map<String, dynamic> json) =
      _$CreatePostRequestImpl.fromJson;

  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'imageUrls')
  String? get imageUrls;

  /// Create a copy of CreatePostRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatePostRequestImplCopyWith<_$CreatePostRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

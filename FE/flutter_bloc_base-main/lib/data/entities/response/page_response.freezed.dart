// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageResponse<T> _$PageResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PageResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PageResponse<T> {
  @JsonKey(name: 'items')
  List<T> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'pageSize')
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalElements')
  int get totalElements => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasNext')
  bool get hasNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasPrevious')
  bool get hasPrevious => throw _privateConstructorUsedError;

  /// Serializes this PageResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageResponseCopyWith<T, PageResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageResponseCopyWith<T, $Res> {
  factory $PageResponseCopyWith(
          PageResponse<T> value, $Res Function(PageResponse<T>) then) =
      _$PageResponseCopyWithImpl<T, $Res, PageResponse<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<T> items,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'pageSize') int pageSize,
      @JsonKey(name: 'totalElements') int totalElements,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'hasNext') bool hasNext,
      @JsonKey(name: 'hasPrevious') bool hasPrevious});
}

/// @nodoc
class _$PageResponseCopyWithImpl<T, $Res, $Val extends PageResponse<T>>
    implements $PageResponseCopyWith<T, $Res> {
  _$PageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? pageSize = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageResponseImplCopyWith<T, $Res>
    implements $PageResponseCopyWith<T, $Res> {
  factory _$$PageResponseImplCopyWith(_$PageResponseImpl<T> value,
          $Res Function(_$PageResponseImpl<T>) then) =
      __$$PageResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'items') List<T> items,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'pageSize') int pageSize,
      @JsonKey(name: 'totalElements') int totalElements,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'hasNext') bool hasNext,
      @JsonKey(name: 'hasPrevious') bool hasPrevious});
}

/// @nodoc
class __$$PageResponseImplCopyWithImpl<T, $Res>
    extends _$PageResponseCopyWithImpl<T, $Res, _$PageResponseImpl<T>>
    implements _$$PageResponseImplCopyWith<T, $Res> {
  __$$PageResponseImplCopyWithImpl(
      _$PageResponseImpl<T> _value, $Res Function(_$PageResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? pageSize = null,
    Object? totalElements = null,
    Object? totalPages = null,
    Object? hasNext = null,
    Object? hasPrevious = null,
  }) {
    return _then(_$PageResponseImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalElements: null == totalElements
          ? _value.totalElements
          : totalElements // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPrevious: null == hasPrevious
          ? _value.hasPrevious
          : hasPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PageResponseImpl<T> implements _PageResponse<T> {
  const _$PageResponseImpl(
      {@JsonKey(name: 'items') required final List<T> items,
      @JsonKey(name: 'page') required this.page,
      @JsonKey(name: 'pageSize') required this.pageSize,
      @JsonKey(name: 'totalElements') required this.totalElements,
      @JsonKey(name: 'totalPages') required this.totalPages,
      @JsonKey(name: 'hasNext') required this.hasNext,
      @JsonKey(name: 'hasPrevious') required this.hasPrevious})
      : _items = items;

  factory _$PageResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PageResponseImplFromJson(json, fromJsonT);

  final List<T> _items;
  @override
  @JsonKey(name: 'items')
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'pageSize')
  final int pageSize;
  @override
  @JsonKey(name: 'totalElements')
  final int totalElements;
  @override
  @JsonKey(name: 'totalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'hasNext')
  final bool hasNext;
  @override
  @JsonKey(name: 'hasPrevious')
  final bool hasPrevious;

  @override
  String toString() {
    return 'PageResponse<$T>(items: $items, page: $page, pageSize: $pageSize, totalElements: $totalElements, totalPages: $totalPages, hasNext: $hasNext, hasPrevious: $hasPrevious)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalElements, totalElements) ||
                other.totalElements == totalElements) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.hasPrevious, hasPrevious) ||
                other.hasPrevious == hasPrevious));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      page,
      pageSize,
      totalElements,
      totalPages,
      hasNext,
      hasPrevious);

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageResponseImplCopyWith<T, _$PageResponseImpl<T>> get copyWith =>
      __$$PageResponseImplCopyWithImpl<T, _$PageResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PageResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PageResponse<T> implements PageResponse<T> {
  const factory _PageResponse(
          {@JsonKey(name: 'items') required final List<T> items,
          @JsonKey(name: 'page') required final int page,
          @JsonKey(name: 'pageSize') required final int pageSize,
          @JsonKey(name: 'totalElements') required final int totalElements,
          @JsonKey(name: 'totalPages') required final int totalPages,
          @JsonKey(name: 'hasNext') required final bool hasNext,
          @JsonKey(name: 'hasPrevious') required final bool hasPrevious}) =
      _$PageResponseImpl<T>;

  factory _PageResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PageResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'items')
  List<T> get items;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'pageSize')
  int get pageSize;
  @override
  @JsonKey(name: 'totalElements')
  int get totalElements;
  @override
  @JsonKey(name: 'totalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'hasNext')
  bool get hasNext;
  @override
  @JsonKey(name: 'hasPrevious')
  bool get hasPrevious;

  /// Create a copy of PageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageResponseImplCopyWith<T, _$PageResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

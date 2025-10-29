// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_body_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyBodyState {
  List<BodyProgressResponse> get bodyProgressList =>
      throw _privateConstructorUsedError;
  BodyProgressResponse? get latestProgress =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCreating => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of MyBodyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyBodyStateCopyWith<MyBodyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBodyStateCopyWith<$Res> {
  factory $MyBodyStateCopyWith(
          MyBodyState value, $Res Function(MyBodyState) then) =
      _$MyBodyStateCopyWithImpl<$Res, MyBodyState>;
  @useResult
  $Res call(
      {List<BodyProgressResponse> bodyProgressList,
      BodyProgressResponse? latestProgress,
      bool isLoading,
      bool isCreating,
      String? error});

  $BodyProgressResponseCopyWith<$Res>? get latestProgress;
}

/// @nodoc
class _$MyBodyStateCopyWithImpl<$Res, $Val extends MyBodyState>
    implements $MyBodyStateCopyWith<$Res> {
  _$MyBodyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyBodyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyProgressList = null,
    Object? latestProgress = freezed,
    Object? isLoading = null,
    Object? isCreating = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      bodyProgressList: null == bodyProgressList
          ? _value.bodyProgressList
          : bodyProgressList // ignore: cast_nullable_to_non_nullable
              as List<BodyProgressResponse>,
      latestProgress: freezed == latestProgress
          ? _value.latestProgress
          : latestProgress // ignore: cast_nullable_to_non_nullable
              as BodyProgressResponse?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of MyBodyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyProgressResponseCopyWith<$Res>? get latestProgress {
    if (_value.latestProgress == null) {
      return null;
    }

    return $BodyProgressResponseCopyWith<$Res>(_value.latestProgress!, (value) {
      return _then(_value.copyWith(latestProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyBodyStateImplCopyWith<$Res>
    implements $MyBodyStateCopyWith<$Res> {
  factory _$$MyBodyStateImplCopyWith(
          _$MyBodyStateImpl value, $Res Function(_$MyBodyStateImpl) then) =
      __$$MyBodyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BodyProgressResponse> bodyProgressList,
      BodyProgressResponse? latestProgress,
      bool isLoading,
      bool isCreating,
      String? error});

  @override
  $BodyProgressResponseCopyWith<$Res>? get latestProgress;
}

/// @nodoc
class __$$MyBodyStateImplCopyWithImpl<$Res>
    extends _$MyBodyStateCopyWithImpl<$Res, _$MyBodyStateImpl>
    implements _$$MyBodyStateImplCopyWith<$Res> {
  __$$MyBodyStateImplCopyWithImpl(
      _$MyBodyStateImpl _value, $Res Function(_$MyBodyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyBodyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyProgressList = null,
    Object? latestProgress = freezed,
    Object? isLoading = null,
    Object? isCreating = null,
    Object? error = freezed,
  }) {
    return _then(_$MyBodyStateImpl(
      bodyProgressList: null == bodyProgressList
          ? _value._bodyProgressList
          : bodyProgressList // ignore: cast_nullable_to_non_nullable
              as List<BodyProgressResponse>,
      latestProgress: freezed == latestProgress
          ? _value.latestProgress
          : latestProgress // ignore: cast_nullable_to_non_nullable
              as BodyProgressResponse?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MyBodyStateImpl implements _MyBodyState {
  const _$MyBodyStateImpl(
      {final List<BodyProgressResponse> bodyProgressList = const [],
      this.latestProgress,
      this.isLoading = false,
      this.isCreating = false,
      this.error})
      : _bodyProgressList = bodyProgressList;

  final List<BodyProgressResponse> _bodyProgressList;
  @override
  @JsonKey()
  List<BodyProgressResponse> get bodyProgressList {
    if (_bodyProgressList is EqualUnmodifiableListView)
      return _bodyProgressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bodyProgressList);
  }

  @override
  final BodyProgressResponse? latestProgress;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCreating;
  @override
  final String? error;

  @override
  String toString() {
    return 'MyBodyState(bodyProgressList: $bodyProgressList, latestProgress: $latestProgress, isLoading: $isLoading, isCreating: $isCreating, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyBodyStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bodyProgressList, _bodyProgressList) &&
            (identical(other.latestProgress, latestProgress) ||
                other.latestProgress == latestProgress) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bodyProgressList),
      latestProgress,
      isLoading,
      isCreating,
      error);

  /// Create a copy of MyBodyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyBodyStateImplCopyWith<_$MyBodyStateImpl> get copyWith =>
      __$$MyBodyStateImplCopyWithImpl<_$MyBodyStateImpl>(this, _$identity);
}

abstract class _MyBodyState implements MyBodyState {
  const factory _MyBodyState(
      {final List<BodyProgressResponse> bodyProgressList,
      final BodyProgressResponse? latestProgress,
      final bool isLoading,
      final bool isCreating,
      final String? error}) = _$MyBodyStateImpl;

  @override
  List<BodyProgressResponse> get bodyProgressList;
  @override
  BodyProgressResponse? get latestProgress;
  @override
  bool get isLoading;
  @override
  bool get isCreating;
  @override
  String? get error;

  /// Create a copy of MyBodyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyBodyStateImplCopyWith<_$MyBodyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

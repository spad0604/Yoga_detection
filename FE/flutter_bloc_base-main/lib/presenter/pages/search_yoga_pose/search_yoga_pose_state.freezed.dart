// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_yoga_pose_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchYogaPoseState {
  SearchYogaPoseStatus get status => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of SearchYogaPoseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchYogaPoseStateCopyWith<SearchYogaPoseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchYogaPoseStateCopyWith<$Res> {
  factory $SearchYogaPoseStateCopyWith(
          SearchYogaPoseState value, $Res Function(SearchYogaPoseState) then) =
      _$SearchYogaPoseStateCopyWithImpl<$Res, SearchYogaPoseState>;
  @useResult
  $Res call({SearchYogaPoseStatus status, BaseException<dynamic>? error});
}

/// @nodoc
class _$SearchYogaPoseStateCopyWithImpl<$Res, $Val extends SearchYogaPoseState>
    implements $SearchYogaPoseStateCopyWith<$Res> {
  _$SearchYogaPoseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchYogaPoseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchYogaPoseStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchYogaPoseStateImplCopyWith<$Res>
    implements $SearchYogaPoseStateCopyWith<$Res> {
  factory _$$SearchYogaPoseStateImplCopyWith(_$SearchYogaPoseStateImpl value,
          $Res Function(_$SearchYogaPoseStateImpl) then) =
      __$$SearchYogaPoseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchYogaPoseStatus status, BaseException<dynamic>? error});
}

/// @nodoc
class __$$SearchYogaPoseStateImplCopyWithImpl<$Res>
    extends _$SearchYogaPoseStateCopyWithImpl<$Res, _$SearchYogaPoseStateImpl>
    implements _$$SearchYogaPoseStateImplCopyWith<$Res> {
  __$$SearchYogaPoseStateImplCopyWithImpl(_$SearchYogaPoseStateImpl _value,
      $Res Function(_$SearchYogaPoseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchYogaPoseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$SearchYogaPoseStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchYogaPoseStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$SearchYogaPoseStateImpl implements _SearchYogaPoseState {
  const _$SearchYogaPoseStateImpl(
      {this.status = SearchYogaPoseStatus.initial, this.error});

  @override
  @JsonKey()
  final SearchYogaPoseStatus status;
  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'SearchYogaPoseState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchYogaPoseStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  /// Create a copy of SearchYogaPoseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchYogaPoseStateImplCopyWith<_$SearchYogaPoseStateImpl> get copyWith =>
      __$$SearchYogaPoseStateImplCopyWithImpl<_$SearchYogaPoseStateImpl>(
          this, _$identity);
}

abstract class _SearchYogaPoseState implements SearchYogaPoseState {
  const factory _SearchYogaPoseState(
      {final SearchYogaPoseStatus status,
      final BaseException<dynamic>? error}) = _$SearchYogaPoseStateImpl;

  @override
  SearchYogaPoseStatus get status;
  @override
  BaseException<dynamic>? get error;

  /// Create a copy of SearchYogaPoseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchYogaPoseStateImplCopyWith<_$SearchYogaPoseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

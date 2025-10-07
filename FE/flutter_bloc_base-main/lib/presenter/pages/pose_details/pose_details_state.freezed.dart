// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pose_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoseDetailsState {
  PoseDetailsStatus get status => throw _privateConstructorUsedError;
  YogaPoseDetails? get yogaPoseDetails => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;

  /// Create a copy of PoseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoseDetailsStateCopyWith<PoseDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoseDetailsStateCopyWith<$Res> {
  factory $PoseDetailsStateCopyWith(
          PoseDetailsState value, $Res Function(PoseDetailsState) then) =
      _$PoseDetailsStateCopyWithImpl<$Res, PoseDetailsState>;
  @useResult
  $Res call(
      {PoseDetailsStatus status,
      YogaPoseDetails? yogaPoseDetails,
      BaseException<dynamic>? error});

  $YogaPoseDetailsCopyWith<$Res>? get yogaPoseDetails;
}

/// @nodoc
class _$PoseDetailsStateCopyWithImpl<$Res, $Val extends PoseDetailsState>
    implements $PoseDetailsStateCopyWith<$Res> {
  _$PoseDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? yogaPoseDetails = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PoseDetailsStatus,
      yogaPoseDetails: freezed == yogaPoseDetails
          ? _value.yogaPoseDetails
          : yogaPoseDetails // ignore: cast_nullable_to_non_nullable
              as YogaPoseDetails?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ) as $Val);
  }

  /// Create a copy of PoseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $YogaPoseDetailsCopyWith<$Res>? get yogaPoseDetails {
    if (_value.yogaPoseDetails == null) {
      return null;
    }

    return $YogaPoseDetailsCopyWith<$Res>(_value.yogaPoseDetails!, (value) {
      return _then(_value.copyWith(yogaPoseDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PoseDetailsStateImplCopyWith<$Res>
    implements $PoseDetailsStateCopyWith<$Res> {
  factory _$$PoseDetailsStateImplCopyWith(_$PoseDetailsStateImpl value,
          $Res Function(_$PoseDetailsStateImpl) then) =
      __$$PoseDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PoseDetailsStatus status,
      YogaPoseDetails? yogaPoseDetails,
      BaseException<dynamic>? error});

  @override
  $YogaPoseDetailsCopyWith<$Res>? get yogaPoseDetails;
}

/// @nodoc
class __$$PoseDetailsStateImplCopyWithImpl<$Res>
    extends _$PoseDetailsStateCopyWithImpl<$Res, _$PoseDetailsStateImpl>
    implements _$$PoseDetailsStateImplCopyWith<$Res> {
  __$$PoseDetailsStateImplCopyWithImpl(_$PoseDetailsStateImpl _value,
      $Res Function(_$PoseDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? yogaPoseDetails = freezed,
    Object? error = freezed,
  }) {
    return _then(_$PoseDetailsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PoseDetailsStatus,
      yogaPoseDetails: freezed == yogaPoseDetails
          ? _value.yogaPoseDetails
          : yogaPoseDetails // ignore: cast_nullable_to_non_nullable
              as YogaPoseDetails?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
    ));
  }
}

/// @nodoc

class _$PoseDetailsStateImpl implements _PoseDetailsState {
  const _$PoseDetailsStateImpl(
      {this.status = PoseDetailsStatus.initial,
      this.yogaPoseDetails,
      this.error});

  @override
  @JsonKey()
  final PoseDetailsStatus status;
  @override
  final YogaPoseDetails? yogaPoseDetails;
  @override
  final BaseException<dynamic>? error;

  @override
  String toString() {
    return 'PoseDetailsState(status: $status, yogaPoseDetails: $yogaPoseDetails, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoseDetailsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.yogaPoseDetails, yogaPoseDetails) ||
                other.yogaPoseDetails == yogaPoseDetails) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, yogaPoseDetails, error);

  /// Create a copy of PoseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoseDetailsStateImplCopyWith<_$PoseDetailsStateImpl> get copyWith =>
      __$$PoseDetailsStateImplCopyWithImpl<_$PoseDetailsStateImpl>(
          this, _$identity);
}

abstract class _PoseDetailsState implements PoseDetailsState {
  const factory _PoseDetailsState(
      {final PoseDetailsStatus status,
      final YogaPoseDetails? yogaPoseDetails,
      final BaseException<dynamic>? error}) = _$PoseDetailsStateImpl;

  @override
  PoseDetailsStatus get status;
  @override
  YogaPoseDetails? get yogaPoseDetails;
  @override
  BaseException<dynamic>? get error;

  /// Create a copy of PoseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoseDetailsStateImplCopyWith<_$PoseDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

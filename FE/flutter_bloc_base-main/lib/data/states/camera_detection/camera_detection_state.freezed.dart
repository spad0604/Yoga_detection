// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_detection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraDetectionState {
  CameraDetectionStatus get status => throw _privateConstructorUsedError;
  BaseException<dynamic>? get error => throw _privateConstructorUsedError;
  List<Pose> get poseList => throw _privateConstructorUsedError;

  /// Create a copy of CameraDetectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraDetectionStateCopyWith<CameraDetectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraDetectionStateCopyWith<$Res> {
  factory $CameraDetectionStateCopyWith(CameraDetectionState value,
          $Res Function(CameraDetectionState) then) =
      _$CameraDetectionStateCopyWithImpl<$Res, CameraDetectionState>;
  @useResult
  $Res call(
      {CameraDetectionStatus status,
      BaseException<dynamic>? error,
      List<Pose> poseList});
}

/// @nodoc
class _$CameraDetectionStateCopyWithImpl<$Res,
        $Val extends CameraDetectionState>
    implements $CameraDetectionStateCopyWith<$Res> {
  _$CameraDetectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CameraDetectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? poseList = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CameraDetectionStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
      poseList: null == poseList
          ? _value.poseList
          : poseList // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CameraDetectionStateImplCopyWith<$Res>
    implements $CameraDetectionStateCopyWith<$Res> {
  factory _$$CameraDetectionStateImplCopyWith(_$CameraDetectionStateImpl value,
          $Res Function(_$CameraDetectionStateImpl) then) =
      __$$CameraDetectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CameraDetectionStatus status,
      BaseException<dynamic>? error,
      List<Pose> poseList});
}

/// @nodoc
class __$$CameraDetectionStateImplCopyWithImpl<$Res>
    extends _$CameraDetectionStateCopyWithImpl<$Res, _$CameraDetectionStateImpl>
    implements _$$CameraDetectionStateImplCopyWith<$Res> {
  __$$CameraDetectionStateImplCopyWithImpl(_$CameraDetectionStateImpl _value,
      $Res Function(_$CameraDetectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CameraDetectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? poseList = null,
  }) {
    return _then(_$CameraDetectionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CameraDetectionStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as BaseException<dynamic>?,
      poseList: null == poseList
          ? _value._poseList
          : poseList // ignore: cast_nullable_to_non_nullable
              as List<Pose>,
    ));
  }
}

/// @nodoc

class _$CameraDetectionStateImpl implements _CameraDetectionState {
  const _$CameraDetectionStateImpl(
      {this.status = CameraDetectionStatus.initial,
      this.error,
      final List<Pose> poseList = const []})
      : _poseList = poseList;

  @override
  @JsonKey()
  final CameraDetectionStatus status;
  @override
  final BaseException<dynamic>? error;
  final List<Pose> _poseList;
  @override
  @JsonKey()
  List<Pose> get poseList {
    if (_poseList is EqualUnmodifiableListView) return _poseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poseList);
  }

  @override
  String toString() {
    return 'CameraDetectionState(status: $status, error: $error, poseList: $poseList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraDetectionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other._poseList, _poseList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error,
      const DeepCollectionEquality().hash(_poseList));

  /// Create a copy of CameraDetectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraDetectionStateImplCopyWith<_$CameraDetectionStateImpl>
      get copyWith =>
          __$$CameraDetectionStateImplCopyWithImpl<_$CameraDetectionStateImpl>(
              this, _$identity);
}

abstract class _CameraDetectionState implements CameraDetectionState {
  const factory _CameraDetectionState(
      {final CameraDetectionStatus status,
      final BaseException<dynamic>? error,
      final List<Pose> poseList}) = _$CameraDetectionStateImpl;

  @override
  CameraDetectionStatus get status;
  @override
  BaseException<dynamic>? get error;
  @override
  List<Pose> get poseList;

  /// Create a copy of CameraDetectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraDetectionStateImplCopyWith<_$CameraDetectionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
